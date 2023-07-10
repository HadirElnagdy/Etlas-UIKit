//
//  AllArticlesResponse.swift
//  Etlas
//
//  Created by Hadir on 07/07/2023.
//

import Foundation

// MARK: - AllArticlesResponse
struct AllArticlesResponse: Codable {
    let count: Int?
    let results: [ArticleResult]?
    let next, previous: String?
}

// MARK: - ArticleResult
struct ArticleResult: Codable {
    let articleTitle, date, description, imageURL: String?
    let id: Int?
    let sections: [ArticleSection]?
    let monuments: [MonumentResult]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case articleTitle = "article_title"
        case date
        case imageURL = "image_url"
        case description, sections, monuments
    }
}



// MARK: - ArticleSection
struct ArticleSection: Codable {
    let id: Int?
    let sectionTitle, description: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case sectionTitle = "section_title"
        case description
    }
}


