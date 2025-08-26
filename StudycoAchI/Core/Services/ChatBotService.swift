//
//  ChatBotService.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/26/25.
//

import Foundation
import Moya

class ChatBotService {
    private let provider = MoyaProvider<OpenAIAPI>()
    private var conversationHistory: [Message] = []
    
    init() {
        // 시스템 메시지로 AI 성격 설정
        let systemMessage = Message(
            role: "system",
            content: "당신은 도움이 되는 AI 어시스턴트입니다. 한국어로 친절하게 답변하고, 이전 대화 내용을 기억하여 연관된 답변을 해주세요."
        )
        conversationHistory.append(systemMessage)
    }
    
    /// 질문을 보내고 답변을 받는 메서드 (대화 기록 유지)
    func sendMessage(_ message: String, completion: @escaping (String?) -> Void) {
        // 사용자 메시지를 대화 기록에 추가
        let userMessage = Message(role: "user", content: message)
        conversationHistory.append(userMessage)
        
        // API 호출
        provider.request(.chat(messages: conversationHistory)) { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    let chatResponse = try response.map(ChatCompletionResponse.self)
                    
                    if let aiMessage = chatResponse.choices.first?.message {
                        // AI 응답도 대화 기록에 추가
                        self?.conversationHistory.append(aiMessage)
                        completion(aiMessage.content)
                    } else {
                        completion(nil)
                    }
                } catch {
                    print("응답 파싱 오류: \(error)")
                    completion(nil)
                }
            case .failure(let error):
                print("네트워크 오류: \(error)")
                completion(nil)
            }
        }
    }
    
    /// 대화 기록 초기화 (새로운 대화 시작)
    func clearHistory() {
        conversationHistory.removeAll()
        let systemMessage = Message(
            role: "system",
            content: "당신은 도움이 되는 AI 어시스턴트입니다. 한국어로 친절하게 답변하고, 이전 대화 내용을 기억하여 연관된 답변을 해주세요."
        )
        conversationHistory.append(systemMessage)
    }
    
    /// 현재 대화 기록 가져오기
    func getConversationHistory() -> [Message] {
        return conversationHistory.filter { $0.role != "system" } // 시스템 메시지 제외
    }
}
