//
//  SubjectService.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/28/25.
//

import Foundation
import Moya

protocol SubjectServiceType {
    func createSubject(user: User, name: String) // 과목 생성
    func getSubjects(user:User) async throws -> [SubjectResponse] // 과목 불러오기
    func deleteSubject(subjectId: String)
}

class SubjectService: SubjectServiceType {
    
    
    
    static let shared = SubjectService()
    let provider = MoyaProvider<SubjectTarget>(plugins: [MoyaLoggingPlugin()])
    
    func createSubject(user: User, name: String) {
        provider.request(.createSubject(uuid: user.uuid, name: name)) { result in
            switch result {
            case .success(let response):
                // 성공시 응답 데이터 출력
                print("\(response)")
            case .failure(let error):
                Log.network("실패", error) // 기존의 로그를 사용
                
            }
        }
        
        
    }
    
    @MainActor
    func getSubjects(user: User) async throws -> [SubjectResponse] {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.getSubjects(uuid: user.uuid)) { result in
                switch result {
                case .success(let response) :
                    do {
                        let decodedResponse = try JSONDecoder().decode(GetSubjectResponse.self, from: response.data)
                        let subjects = decodedResponse.data
                        continuation.resume(returning: subjects)
                        
                    } catch {
                        Log.network("모든 과목 불러오기 실패", error)
                    }
                case .failure(let error):
                    Log.network("모든 타임캡슐 죄회 네트워크 오류", error)
                    continuation.resume(throwing: error)
                }
            
            
                
            }
        }
    }
    
    func deleteSubject(subjectId: String) {
        provider.request(.deleteSubject(uuid: subjectId)) { reslut in
            switch reslut {
            case .success(let response):
                print("\(response)")
            case .failure(let error):
                Log.network("실패",error)
    
            }
        }
    }
}
