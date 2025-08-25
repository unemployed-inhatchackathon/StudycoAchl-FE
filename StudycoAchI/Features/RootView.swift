//
//  RootView.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/25/25.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: ChatListView()) {
                    Text("ChatListView")
                }
                NavigationLink(destination: ChatView()) {
                  Text("ChatView")
                }
                NavigationLink(destination: HomeView()) {
                    Text("HomeView")
                }
                NavigationLink(destination: LearningMenu()) {
                    Text("LearningMenu")
                }
                NavigationLink(destination: ProblemListView()) {
                    Text("ProblemListView")
                }
                NavigationLink(destination: ProblemSolvingView()) {
                    Text("ProblemSolvingView")
                }
                NavigationLink(destination: CustomChatModal(text: Binding.constant(""), modalType: .add)) {
                    Text("CustomChatModal: add")
                }
                NavigationLink(destination: CustomChatModal(text: Binding.constant(""), modalType: .delete)) {
                    Text("CustomChatModal: delete")
                }
                NavigationLink(destination: CustomChatModal(text: Binding.constant(""), modalType: .edit)) {
                    Text("CustomChatModal: edit")
                }
                NavigationLink(destination: CustomProblemModal(text: Binding.constant(""), modalType: .add1)) {
                    Text("CustomProblemmodal: add1")
                }
                NavigationLink(destination: CustomProblemModal(text: Binding.constant(""), modalType: .add2)) {
                    Text("CustomProblemmodal: add2")
                }
                NavigationLink(destination: CustomProblemModal(text: Binding.constant(""), modalType: .delete)) {
                    Text("CustomProblemmodal: delete")
                }
                NavigationLink(destination: CustomProblemModal(text: Binding.constant(""), modalType: .edit)) {
                    Text("CustomProblemmodal: edit")
                }
                NavigationLink(destination: CustomSubjectModalView(text: Binding.constant(""), modalType: .add)) {
                    Text("CustomProblemmodal: add")
                }
                NavigationLink(destination: CustomSubjectModalView(text: Binding.constant(""), modalType: .delete)) {
                    Text("CustomSubjectmodal: delete")
                }
                NavigationLink(destination: CustomSubjectModalView(text: Binding.constant(""), modalType: .edit)) {
                    Text("CustomSubjectmodal: edit")
                }
            }
        }
        
    }
}

#Preview {
    RootView()
}
