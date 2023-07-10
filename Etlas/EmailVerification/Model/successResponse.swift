//
//  successResponse.swift
//  Etlas
//
//  Created by Hadir on 03/07/2023.
//

import Foundation

struct successResponse: Codable {
       let success: String
   }

struct imgResponse: Codable {
    let imgURL: String?
    
    enum CodingKeys: String, CodingKey {
        case imgURL = "image_url"
    }
}
