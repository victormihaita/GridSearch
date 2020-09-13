//
//  AppDetail.swift
//  GridSearch
//
//  Created by Victor Mihaita on 13/09/2020.
//  Copyright © 2020 Victor Mihaita. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct AppDetail: View {
    let item: Result

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                WebImage(url: URL(string: item.artworkUrl100))
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                    .cornerRadius(22)

                VStack(alignment: .leading) {
                    Text(item.name)
                    Text(item.copyright)
                    Text(item.releaseDate)
                }

                Spacer()
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}
