//
//  SearchResponse.swift
//  iOS Test Task
//
//  Created by Balázs Bencze on 12.04.2022.
//

import UIKit

struct SearchResponse: Codable {
    let hits: [SearchItem]
}

struct SearchItem: Codable {
    let id: String
    let title: String?
    let thumbUrl: String
    let creator: SearchItemCreator
    let dateCreated: String
    let dateModified: String
}

struct SearchItemCreator: Codable {
    let name: String
}
