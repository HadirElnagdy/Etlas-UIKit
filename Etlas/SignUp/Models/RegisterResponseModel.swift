//
//  RegisterResponseModel.swift
//  Etlas
//
//  Created by Hadir on 01/07/2023.
//

import Foundation

struct RegisterResponseModel: Codable {
    let email, fullName, address, phoneNumber, imgURL: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case email
        case id
        case fullName = "full_name"
        case address
        case phoneNumber = "phone_number"
        case imgURL = "image_url"
    }
}
