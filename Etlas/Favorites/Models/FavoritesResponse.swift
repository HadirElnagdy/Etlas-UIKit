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
    let monument: FavMonument?
    let article: FavArticle?
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, monument, article
        case createdAt = "created_at"
    }
}

struct FavMonument: Codable {
    let id: Int
    let name: String
    let description: String
    let created: String
    let updated: String
    let threeDModel: FavThreeDModel?
    let location: String
    let date: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, created, updated, location, date
        case threeDModel = "three_d_model"
        case imageUrl = "image_url"
    }
}

struct FavThreeDModel: Codable {
    let modelObj: String
    let modelTexture: String
    
    enum CodingKeys: String, CodingKey {
        case modelObj = "model_obj"
        case modelTexture = "model_texture"
    }
}

struct FavArticle: Codable {
    let id: Int
    let articleTitle: String
    let date: String
    let imageUrl: String
    let description: String
    let sections: [FavSection]
    let monuments: [Monument]
    
    enum CodingKeys: String, CodingKey {
        case id, date, description, sections, monuments
        case articleTitle = "article_title"
        case imageUrl = "image_url"
    }
}

struct FavSection: Codable {
    let id: Int
    let sectionTitle: String
    let description: String
}



