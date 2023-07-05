//
//  ScoreResponse.swift
//  Etlas
//
//  Created by Hadir on 05/07/2023.
//

import Foundation

// MARK: - LandmarksScoreResponse
struct LandmarksScoreResponse: Codable {
    let bestScoreLandmarks: String?

    enum CodingKeys: String, CodingKey {
        case bestScoreLandmarks = "best_score_landmarks"
    }
}

// MARK: - MonumentsScoreResponse
struct MonumentsScoreResponse: Codable {
    let bestScoreMonuments: String?

    enum CodingKeys: String, CodingKey {
        case bestScoreMonuments = "best_score_monuments"
    }
}

// MARK: - StatuesScoreResponse
struct StatuesScoreResponse: Codable {
    let bestScoreStatues: String?

    enum CodingKeys: String, CodingKey {
        case bestScoreStatues = "best_score_statues"
    }
}

// MARK: - StatuesScoreResponse
struct BestScoreResponse: Codable {
    let totalBestScore: Int?

    enum CodingKeys: String, CodingKey {
        case totalBestScore = "total_best_score"
    }
}
