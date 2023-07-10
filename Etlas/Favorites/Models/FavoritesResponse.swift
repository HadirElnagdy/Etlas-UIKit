//
//  FavoritesResponse.swift
//  Etlas
//
//  Created by Hadir on 09/07/2023.
//

import Foundation

struct FavoritesResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [FavoritesResult]
}

struct FavoritesResult: Codable {
    let id: Int
    let monument: MonumentResult?
    let article: ArticleResult?
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, monument, article
        case createdAt = "created_at"
    }
}





