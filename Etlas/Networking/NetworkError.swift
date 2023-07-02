//
//  NetworkError.swift
//  Etlas
//
//  Created by Hadir on 01/07/2023.
//

import Foundation
enum NetworkError: Error {
    var message: String {
        switch self {
        case .networkError(let networkMessage):
            return networkMessage
        default:
            return "Something went wrong".localized
        }
    }
    
    case networkError(message: String)
    case other
}
