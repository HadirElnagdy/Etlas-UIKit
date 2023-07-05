//
//  verifyPasswordOTPResponse.swift
//  Etlas
//
//  Created by Hadir on 05/07/2023.
//

import Foundation

struct verifyPasswordOTPResponse: Codable{
    let success, userId, token: String?
    
    enum CodingKeys: String, CodingKey {
        case userId = "uidb64"
        case token, success
    }
}
