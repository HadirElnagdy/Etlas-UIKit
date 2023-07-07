//
//  Monument.swift
//  Etlas
//
//  Created by Hadir on 25/06/2023.
//

import Foundation

// MARK: - Monument
struct Monument: Codable {
    let count: String?
    let results: [MonumentResult]?
    let next, previous: String?
}


// MARK: - MonumentResult
struct MonumentResult: Codable {
    let id: Int?
    let name, description, created, updated: String?
    let threeDModel: ThreeDModel?

    enum CodingKeys: String, CodingKey {
        case id, name, description, created, updated
        case threeDModel = "three_d_model"
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
