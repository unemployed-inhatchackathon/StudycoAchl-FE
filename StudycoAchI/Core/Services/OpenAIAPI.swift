//
//  APIClient.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/22/25.
//

import Foundation
import Moya

enum OpenAIAPI {
    case chat(messages: [Message])
}

extension OpenAIAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.openai.com/v1")!
    }
    
    var path: String {
        return "/chat/completions"
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case .chat(let messages):
            let request = ChatCompletionRequest(
                model: "gpt-3.5-turbo",
                messages: messages,
                maxTokens: 500
            )
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(OpenAIConfig.apiKey)" // 🔑 실제 API 키로 교체
        ]
    }
}
