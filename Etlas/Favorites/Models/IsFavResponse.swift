//
//  IsFavResponse.swift
//  Etlas
//
//  Created by Hadir on 09/07/2023.
//

import Foundation
struct IsFavoriteResponse : Codable {
    
    let isFavorite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case isFavorite = "is_favorite"
    }
}
