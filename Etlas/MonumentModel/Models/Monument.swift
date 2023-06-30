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

// MARK: - Result
struct MonumentResult: Codable {
    let name, id, created, updated: String?
}
