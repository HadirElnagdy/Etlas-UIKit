//
//  User.swift
//  Etlas
//
//  Created by Hadir on 25/06/2023.
//

import Foundation

// MARK: - User
struct User: Codable {
    
    let fullName, email, id, address: String?
    let phoneNumber, imageURL: String?

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case email, id, address
        case phoneNumber = "phone_number"
        case imageURL = "image_url"
    }
    
}
