//
//  ChatCompletionRequest.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/26/25.
//

import Foundation

struct ChatCompletionRequest: Codable {
    let model: String
    let messages: [Message]
    let maxTokens: Int?
    
    enum CodingKeys: String, CodingKey {
        case model, messages
        case maxTokens = "max_tokens"
    }
}

struct Message: Codable {
    let role: String
    let content: String
}

struct ChatCompletionResponse: Codable {
    let choices: [Choice]
}

struct Choice: Codable {
    let message: Message
}
