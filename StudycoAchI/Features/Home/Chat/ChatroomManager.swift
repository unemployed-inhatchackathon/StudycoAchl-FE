//
//  ChatroomManager.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/26/25.
//

import Foundation

class ChatroomManager: ObservableObject {
    @Published var chatRooms: [ChatRoom] = []
    @Published var currentRoomId: String? = nil
    
    private let multiChatService = MultichatServer()
    
    /// 새 채팅방 생성
    
    func createNewChatRoom(title: String? = nil, subjectName: String) -> String {
        let roomTitle = title ?? "새 채팅 \(chatRooms.count + 1)"
        let newRoom = multiChatService.createChatRoom(title: roomTitle, subjectName: subjectName)
        
        chatRooms.append(newRoom)
        currentRoomId = newRoom.id
        
        return newRoom.id
    }
    
    //// 특정 채팅방 선택
    func selectChatRoom(_ roomId: String) {
        currentRoomId = roomId
    }
    
    /// 메시지 전송 (현재 선택된 채팅방에)
    func sendMessage(_ message: String, completion: @escaping (String?) -> Void) {
        guard let roomId = currentRoomId else {
            completion(nil)
            return
        }
        
        multiChatService.sendMessage(to: roomId, message: message) { response in
            completion(response)
        }
    }
    
    /// 현재 채팅방의 대화 기록 가져오기
    func getCurrentChatHistory() -> [Message] {
        guard let roomId = currentRoomId else { return [] }
        return multiChatService.getChatHistory(for: roomId)
    }
    
    /// 채팅방 삭제
    func deleteChatRoom(_ roomId: String) {
        multiChatService.deleteChatRoom(roomId)
        chatRooms.removeAll { $0.id == roomId }
        
        if currentRoomId == roomId {
            currentRoomId = chatRooms.first?.id
        }
    }
    
    /// 채팅방 제목 변경
    func updateChatRoomTitle(_ roomId: String, newTitle: String, subjectName: String) {
        if let index = chatRooms.firstIndex(where: { $0.id == roomId }) {
            let oldRoom = chatRooms[index]
            chatRooms[index] = ChatRoom(
                id: oldRoom.id,
                title: newTitle,
                subjectName: subjectName
               
            )
        }
    }
    
  
}
