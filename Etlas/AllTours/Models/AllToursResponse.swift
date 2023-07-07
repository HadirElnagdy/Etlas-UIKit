//
//  AllToursResponse.swift
//  Etlas
//
//  Created by Hadir on 07/07/2023.
//

import Foundation

// MARK: - AllToursResponse
struct AllToursResponse: Codable {
    let count: Int?
    let next, previous: String?
    let results: [Tour]?
}

// MARK: - Result
struct Tour: Codable {
    let id: Int?
    let title, description: String?
    let sections: [Section]?
    let images: [TourImage]?
    let rating: Double?
}

// MARK: - Image
struct TourImage: Codable {
    let id: Int?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image_url"
    }
}

// MARK: - Section
struct Section: Codable {
    let id: Int?
    let title, description: String?
}

