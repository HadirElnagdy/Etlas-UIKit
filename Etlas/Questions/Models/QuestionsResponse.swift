//
//  QuestionsResponse.swift
//  Etlas
//
//  Created by Hadir on 09/07/2023.
//

import Foundation


struct QuestionResponse: Codable {
    let id: Int?
    let statement: String?
    let imageURL: String?
    let label: String?
    let correctChoice: String?
    let shuffledChoices: [Choice]?
    
    enum CodingKeys: String, CodingKey {
        case id, statement
        case imageURL = "image_url"
        case label, correctChoice
        case shuffledChoices = "shuffled_choices"
    }
}

struct Choice: Codable {
    let id: Int?
    let choiceText: String?
    enum CodingKeys: String, CodingKey {
        case id
        case choiceText = "choice_text"
    }
}

