//
//  User.swift
//  Etlas
//
//  Created by Hadir on 04/07/2023.
//

import Foundation

// MARK: - User
struct User: Codable {
    let id: Int?
    let fullName, email, address: String?
    let phoneNumber, imageURL: String?

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case email, id, address
        case phoneNumber = "phone_number"
        case imageURL = "image_url"
    }
}
