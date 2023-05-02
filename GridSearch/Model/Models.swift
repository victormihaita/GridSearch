//
//  Models.swift
//  GridSearch
//
//  Created by Victor Mihaita on 12/09/2020.
//  Copyright © 2020 Victor Mihaita. All rights reserved.
//

import Foundation

struct RSS: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let results: [Result]
}

struct Result: Decodable, Hashable {
    let id, artistName, artworkUrl100, name, releaseDate: String
}
