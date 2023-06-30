//
//  Questions.swift
//  Etlas
//
//  Created by Hadir on 25/06/2023.
//


import Foundation

// MARK: - Questions
struct Questions: Codable {
    let count: String?
    let results: [QuestionsResult]?
    let next, previous: String?
}

// MARK: - Result
struct QuestionsResult: Codable {
    let statement, label, correctChoice, id: String?
    let imageURL, shuffledChoices: String?
}
