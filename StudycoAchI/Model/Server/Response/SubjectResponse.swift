//
//  SubjectResponse.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/28/25.
//

import Foundation

struct GetSubjectResponse: Codable {
    let success: Bool
    let message: String
    let data: [SubjectResponse]
}

struct SubjectResponse: Codable, Equatable, Hashable{
    
    
    let uuid, title, createdAt, userUUID: String
    
    enum CodingKeys: String, CodingKey {
        case uuid, title
        case createdAt = "created_at"
        case userUUID = "userUuid"
    }
}
