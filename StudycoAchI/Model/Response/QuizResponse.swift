//
//  QuizResponse.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/27/25.
//

import Foundation

struct QuizResponse: Codable{
    let questions: [Question]
    let topic: String
    let totalcount: Int
}


struct Question: Codable, Identifiable {
    let id: String
    let question: String
    let options: [String]
    let correctAnswer: Int
    let explanation: String
    let difficulty: String
    
    enum CodingKeys: String, CodingKey {
        case id, question, options, explanation, difficulty
        case correctAnswer = "correct_answer"
    }
    
}
