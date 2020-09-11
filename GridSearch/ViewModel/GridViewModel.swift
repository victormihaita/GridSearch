//
//  GridViewModel.swift
//  GridSearch
//
//  Created by Victor Mihaita on 12/09/2020.
//  Copyright © 2020 Victor Mihaita. All rights reserved.
//

import Foundation
import Combine

class GridViewModel: ObservableObject {
    @Published var items = [Result]()

    private var cancelable: AnyCancellable?
    private let sessionProcessingQueue = DispatchQueue(label: "SessionProcessingQueue")
    private let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/100/explicit.json"

    init() {
        guard let url = URL(string: urlString) else { return }
        cancelable = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: sessionProcessingQueue)
            .map { $0.data }
            .decode(type: RSS.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                switch $0 {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] in
                self?.items = $0.feed.results
            })
    }

    deinit {
        cancelable?.cancel()
    }
}
