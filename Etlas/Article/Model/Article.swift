//
//  Article.swift
//  Etlas
//
//  Created by Hadir on 19/06/2023.
//

import Foundation

// MARK: - Articles
struct Articles: Codable {
    let count: String?
    let results: [ArticleResult]?
    let next, previous: String?
}

// MARK: - ArticleResult
struct ArticleResult: Codable {
    let articleTitle, date, description, id: String?
    let imageURL: String?
    let sections: [ArticleSection]?
    let monuments: [ArticleMonument]?
}

// MARK: - Monument
struct ArticleMonument: Codable {
    let name, id, created, updated: String?
}

// MARK: - ArticleSection
struct ArticleSection: Codable {
    let sectionTitle, description, id: String?
}
