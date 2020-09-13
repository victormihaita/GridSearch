//
//  AppCard.swift
//  GridSearch
//
//  Created by Victor Mihaita on 12/09/2020.
//  Copyright © 2020 Victor Mihaita. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct AppCard: View {
    var item: Result

    var body: some View {
        NavigationLink(destination: AppDetail(item: item)) {
            VStack(alignment: .leading) {
                WebImage(url: URL(string: item.artworkUrl100))
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFit()
                    .cornerRadius(22)
                Text(item.name)
                    .lineLimit(3)
                    .font(.system(size: 10, weight: .semibold))
                Text(item.releaseDate)
                    .lineLimit(1)
                    .font(.system(size: 9, weight: .regular))
                Text(item.copyright)
                    .lineLimit(3)
                    .font(.system(size: 9, weight: .regular))
                    .foregroundColor(.gray)
            }
        }
    }
}
