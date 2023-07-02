//
//  RegisterRequestModel.swift
//  Etlas
//
//  Created by Hadir on 01/07/2023.
//

import Foundation

struct RegisterRequestModel: Codable {
    let fullName, email, password, confirmPassword, address, phoneNumber: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case password
        case fullName = "full_name"
        case confirmPassword = "confirm_password"
        case address
        case phoneNumber = "phone_number"
    }
}
