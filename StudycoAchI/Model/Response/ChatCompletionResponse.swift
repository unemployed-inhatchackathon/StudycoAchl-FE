//
//  File.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/26/25.
//

import Foundation


struct ChatCompletionResponse: Codable {
    let choices: [Choice]
}

struct Choice: Codable {
    let message: Message
}
