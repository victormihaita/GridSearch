//
//  SearchBar.swift
//  GridSearch
//
//  Created by Victor Mihaita on 11/09/2020.
//  Copyright © 2020 Victor Mihaita. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.black)
            TextField("Search", text: $text)
            Spacer(minLength: 0)
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .foregroundColor(Color(.systemGray6))
                        .frame(width: 8, height: 8)
                        .background(Circle().foregroundColor(Color(.systemGray2)).frame(width: 16, height: 16))
                })
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(RoundedRectangle(cornerRadius: 32).foregroundColor(Color(.systemGray6)))
    }
}
