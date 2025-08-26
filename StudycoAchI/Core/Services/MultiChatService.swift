//
//  MultiChatService.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/26/25.
//

import Foundation
import Moya

class MultichatServer {
    private let provider = MoyaProvider<OpenAIAPI>()
    
    // 채팅방별 대화 기록을 저장하는 딕셔너리
    
    private var chatRoomHistories: [String: [Message]] = [:]
    
    /// 새 채팅방 생성
        func createChatRoom(title: String, subjectName: String) -> ChatRoom {
            let roomId = UUID().uuidString
          
            
            // 시스템 메시지로 초기화
            let systemMessage = Message(
                role: "system",
                content: "당신은 도움이 되는 AI 어시스턴트입니다. 한국어로 친절하게 답변하고, 이 채팅방에서의 이전 대화 내용을 기억하여 연관된 답변을 해주세요."
            )
            chatRoomHistories[roomId] = [systemMessage]
            
            return ChatRoom(
                id: roomId,
                title: title,
                subjectName: subjectName
            )
        }
    
    /// 특정 방에서 메세지 전송
    func sendMessage(to roomId: String, message: String, completion: @escaping (String?) -> Void) {
        // 채팅방이 존재하는 지 확인
        guard var roomHistory = chatRoomHistories[roomId] else {
            print("존재하지 않는 채팅방: \(roomId)")
            completion(nil)
            return
        }
        
        // 사용자 메시지를 해당 채팅방 기록에 추가
        
        let userMesagge = Message(role: "user", content: message)
        roomHistory.append(userMesagge)
        chatRoomHistories[roomId] = roomHistory
        
        // API 호출 (해당 채팅방의 대한 기록만 전송)
        provider.request(.chat(messages: roomHistory)) { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    let chatResponse = try response.map(ChatCompletionResponse.self)
                    
                    if let aiMessage = chatResponse.choices.first?.message {
                        // AI 응답을 해당 채팅방 기록에 추가
                        var updatedRoomHistory = self?.chatRoomHistories[roomId] ?? []
                        updatedRoomHistory.append(aiMessage)
                        self?.chatRoomHistories[roomId] = updatedRoomHistory
                        completion(aiMessage.content)
                    } else {
                        completion("응답을 생성할 수 없습니다.")
                    }
                } catch {
                    print("응답 파싱 오류: \(error)")
                    completion("응답을 해석할 수 없습니다.")
                }
            case .failure(let error):
                print("네트워크 오류 \(error)")
                completion("네트워크 연결을 확인해주세요.")
            }
        }
    }
    
    /// 특정 채팅방의 대화 기록 가져오기
    func getChatHistory(for roomId: String) -> [Message] {
        return chatRoomHistories[roomId]?.filter { $0.role != "system" } ?? []
    }
    /// 채팅방 삭제
    func deleteChatRoom(_ roomId: String) {
        chatRoomHistories.removeValue(forKey: roomId)
    }

    
}
