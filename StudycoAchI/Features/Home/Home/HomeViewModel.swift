//
//  HomeViewModel.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/26/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    //    @Published var subjects: [Subject] = []
    @Published private var service  = SubjectService.shared
    @Published var subjects: [SubjectResponse] = []
    @Published var isShowAlert: Bool
    @Published var newSubjectName: String
    @Published var selectedSubject: SubjectResponse?
    @Published var alertType: SubjectModalType
    
    
    init(isShowAlert: Bool = false, newSubjectName: String = "",selectedSubject: SubjectResponse? = nil, alertType: SubjectModalType = .add) {
        self.isShowAlert = isShowAlert
        self.newSubjectName = newSubjectName
        self.selectedSubject = selectedSubject
        self.alertType = alertType
    }
}

extension HomeViewModel {
    func dismissAlert() {
        self.isShowAlert = false
    }
    
    func getSubjects() async {
        Task {
            do {
                let subjects = try await service.getSubjects(user: User(uuid: "550e8400-e29b-41d4-a716-446655440001", name: "test"))
                await MainActor.run {
                    self.subjects = subjects
                }
            } catch {
                print(error)
            }
        }
       
    }
    
    func createSubject() {
        service.createSubject(user: User(uuid: "550e8400-e29b-41d4-a716-446655440001", name: "test"), name: newSubjectName)
        self.isShowAlert = false
        self.newSubjectName = ""
    }
    
    func deleteSubject() {
        guard let selectedSubject = selectedSubject else { return }
        service.deleteSubject(subjectId: selectedSubject.uuid)
        self.isShowAlert = false
        self.newSubjectName = ""
    }
    
    //
    //    func addSubject() {
    //        subjects.append(Subject(id: UUID().uuidString, title: newSubjectName))
    //        newSubjectName = ""
    //        self.isShowAlert = false
    //    }
    //
    //    func editSubject(_ id: String, newTitle: String) {
    //        if let index = self.subjects.firstIndex(where: {$0.id == id}) {
    //            let oldSubject = self.subjects[index]
    //            self.subjects[index] = Subject(
    //                id: oldSubject.id,
    //                title: newTitle
    //            )
    //        }
    //        self.isShowAlert = false
    //    }
    //
    //    func deleteSubject(_ id: String) {
    //        if let index = self.subjects.firstIndex(where: {$0.id == id}) {
    //            self.subjects.remove(at: index)
    //        }
    //        self.isShowAlert = false
    //    }
    
    
    
    
}
