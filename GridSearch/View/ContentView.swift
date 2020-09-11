//
//  ContentView.swift
//  GridSearch
//
//  Created by Victor Mihaita on 11/09/2020.
//  Copyright © 2020 Victor Mihaita. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 16, alignment: .top), count: 3)

    @ObservedObject var vm = GridViewModel()
    @State private var searchData = ""

    var body: some View {
        NavigationView {
            ScrollView {
                SearchBar(text: $searchData)
                    .padding([.horizontal, .bottom], 16)

                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(vm.items.filter { filterName(for: $0) }, id: \.id) {
                        AppCard(item: $0)
                    }
                }.padding(.horizontal, 16)
            }
            .navigationTitle("Grid Search")
            .gesture(DragGesture().onChanged {_ in
                UIApplication.shared.endEditing()
            })
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        }
    }

    private func filterName(for item: Result) -> Bool {
        if searchData.isEmpty {
            return true
        } else {
            return item.name.lowercased().contains(searchData.lowercased())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
