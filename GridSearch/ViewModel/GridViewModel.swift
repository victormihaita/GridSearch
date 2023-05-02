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

    private let pageSize = 20

    private var url: URL? {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/\(pageSize)/albums.json"
        return URL(string: urlString)
    }

    init() {
        guard let url = url else { return }
        cancelable = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global())
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
