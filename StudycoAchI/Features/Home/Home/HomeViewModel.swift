//
//  HomeViewModel.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/26/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var subjects: [Subject] = []
    @Published var isShowAlert: Bool
    @Published var newSubjectName: String
    @Published var selectedSubject: Subject?
    @Published var alertType: SubjectModalType
    
    init(isShowAlert: Bool = false, newSubjectName: String = "",selectedSubject: Subject? = nil, alertType: SubjectModalType = .add) {
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
    
    func addSubject() {
        subjects.append(Subject(id: UUID().uuidString, title: newSubjectName))
        newSubjectName = ""
        self.isShowAlert = false
    }
    
    func editSubject(_ id: String, newTitle: String) {
        if let index = self.subjects.firstIndex(where: {$0.id == id}) {
            let oldSubject = self.subjects[index]
            self.subjects[index] = Subject(
                id: oldSubject.id,
                title: newTitle
            )
        }
        self.isShowAlert = false
    }
    
    func deleteSubject(_ id: String) {
        if let index = self.subjects.firstIndex(where: {$0.id == id}) {
            self.subjects.remove(at: index)
        }
        self.isShowAlert = false
    }
    
    
    
    
}
