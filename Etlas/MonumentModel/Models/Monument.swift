//
//  Monument.swift
//  Etlas
//
//  Created by Hadir on 25/06/2023.
//

import Foundation

// MARK: - Monument
struct Monument: Codable {
    let count: Int?
    let results: [MonumentResult]?
    let next, previous: String?
}


// MARK: - MonumentResult
struct MonumentResult: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let created: String?
    let updated: String?
    let threeDModel: ThreeDModel?
    let location: String?
    let date: String?
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, created, updated, location, date
        case threeDModel = "three_d_model"
        case imageURL = "image_url"
    }
}

// MARK: - ThreeDModel
struct ThreeDModel: Codable {
    let modelObj: String?
    let modelTexture: String?

    enum CodingKeys: String, CodingKey {
        case modelObj = "model_obj"
        case modelTexture = "model_texture"
    }
}


