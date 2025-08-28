//
//  SubjectAPI.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/28/25.
//

import Foundation

/// Subject

public enum SubjectAPI {
    case createSubject(String) // 과목 생성
    case deleteSubject(String) // 과목 삭제
    case getSubjects(String) // 과목 불러오기
    case editSubject(String) // 과목명 수정
    
    public var apiDesc: String {
        switch self {
        case .createSubject(let id):
            return "/api/users/\(id)/subjects"
            
        case .deleteSubject(let id):
            return "/api/\(id)"
            
        case .getSubjects(let id):
            return "/api/users/\(id)/subjects"
            
        case .editSubject(let id):
            return "/api/\(id)"
        }
    }
}
