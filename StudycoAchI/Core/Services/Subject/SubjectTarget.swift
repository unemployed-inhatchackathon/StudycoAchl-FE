//
//  SubjectTarget.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/28/25.
//

import Foundation
import Moya

enum SubjectTarget {
    case createSubject(uuid: String, name: String) // 과목 생성
    case deleteSubject(uuid: String) // 과목 삭제
    case getSubjects(uuid: String) // 과목 불러오기
    case editSubject(uuid: String, newName: String) // 과목명 수정
}

extension SubjectTarget: BaseTargetType {
    var path: String {
        switch self {
            
        case .createSubject(uuid: let uuid, _):
            return SubjectAPI.createSubject(uuid).apiDesc
        case .editSubject(uuid: let uuid, _):
            return SubjectAPI.editSubject(uuid).apiDesc
        case .deleteSubject(uuid: let uuid):
            return SubjectAPI.deleteSubject(uuid).apiDesc
        case .getSubjects(uuid: let uuid):
            return SubjectAPI.getSubjects(uuid).apiDesc
        }
    }
    
    var method: Moya.Method {
        switch self {
            
        case .createSubject:
                return .post
        case .deleteSubject:
            return .delete
        case .getSubjects:
            return .get
        case .editSubject:
            return .put
        }
    }
    
    var task: Moya.Task {
        switch self {
            
        case .createSubject(_, name: let name):
            let body =  name.data(using: .utf8)!
            return .requestData(body)
        case .deleteSubject(_):
                return .requestPlain
        case .getSubjects(_):
            return .requestPlain
        case .editSubject(_, newName: let newName):
            let parameters = ["title": newName]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
            
        case .createSubject(_,_):
            return ["Content-Type": "text/plain"]
        case .deleteSubject(_):
            return [:]
        case .getSubjects(_):
            return [:]
        case .editSubject(_,_):
            return ["Content-Type": "application/json"]
        }
    }
    
    
}
