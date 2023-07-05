//
//  loginResponseModel.swift
//  Etlas
//
//  Created by Hadir on 25/06/2023.
//

import Foundation

// MARK: - User
struct loginResponseModel: Codable {
    let email: String?
    let address, phoneNumber, imageURL: String?
    let tokens: Tokens?

    enum CodingKeys: String, CodingKey {
        case email, address
        case phoneNumber = "phone_number"
        case imageURL = "image_url"
        case tokens
    }
}

// MARK: - Tokens
struct Tokens: Codable {
    let access, refresh: String?
}
