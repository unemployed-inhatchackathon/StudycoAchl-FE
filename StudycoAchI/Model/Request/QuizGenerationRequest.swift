//
//  QuizGenerationRequest.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/27/25.
//

import Foundation

struct QuizeGenerationRequest: Codable {
    let chatHistory: String
    let questionCount: Int
    let difficulty: String

}
