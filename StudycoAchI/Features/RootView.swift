//
//  RootView.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/25/25.
//

import SwiftUI

struct RootView: View {
    @StateObject private var pathModel = PathModel()
    @StateObject private var rootViewModel = RootViewModel()
    @StateObject private var chatManger = ChatroomManager()
    @StateObject private var homeViewModel = HomeViewModel()
    var body: some View {
        ZStack {
            TabView(selection: $rootViewModel.selectedTab) {
                NavigationStack(path: $rootViewModel.paths) {
                    HomeView()
                        .navigationDestination(for: PathType.self) { path in
                            destinationView(for: path)
                        }
                        .environmentObject(homeViewModel)
                     
                }
                .environmentObject(pathModel)
                .tabItem {
                    Image(systemName: rootViewModel.selectedTab == .home ? "house" : "house")
                }
                .tag(Tab.home)
               
                BookMarkView()
                    .tabItem {
                        Image(systemName:
                                rootViewModel.selectedTab == .bookMark ? "bookmark.fill" : "bookmark")
                    }
                    .tag(Tab.bookMark)
                ActivityView()
                    .tabItem {
                        Image(systemName: rootViewModel.selectedTab == .activity ? "chart.bar.fill" :"chart.bar")
                    }
                    .tag(Tab.activity)
                MyPageView()
                    .tabItem {
                        Image(systemName: rootViewModel.selectedTab == .myPage ? "person.fill" : "person")
                    }
                    .tag(Tab.myPage)
                
            }
            .environmentObject(rootViewModel)
            
        }
    }
    
    @ViewBuilder
    func destinationView(for path: PathType) -> some View {
        switch path {
        case .learningMenuView(let subject):
                LearningMenuView(subject: subject)
                    
                .navigationBarBackButtonHidden(true)
        case .chatDetailView(let room):
            ChatView(chatManager: chatManger, room: room)
                .navigationBarBackButtonHidden(true)
        case .cahtListView(let subject):
            ChatListView(subject: subject)
                .environmentObject(chatManger)
                .navigationBarBackButtonHidden(true)
        }
    }
}

private struct SeperatorLineView: View {
  fileprivate var body: some View {
    VStack {
      Spacer()
      
      Rectangle()
        .fill(
          LinearGradient(
            gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.1)]),
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .frame(height: 10)
        .padding(.bottom, 60)
    }
  }
}


#Preview {
    RootView()
}

//NavigationStack {
//    List {
//        NavigationLink(destination: ChatListView()) {
//            Text("ChatListView")
//        }
//        NavigationLink(destination: ChatView()) {
//          Text("ChatView")
//        }
//        NavigationLink(destination: HomeView()) {
//            Text("HomeView")
//        }
//        NavigationLink(destination: LearningMenuView()) {
//            Text("LearningMenu")
//        }
//        NavigationLink(destination: ProblemListView()) {
//            Text("ProblemListView")
//        }
//        NavigationLink(destination: ProblemSolvingView()) {
//            Text("ProblemSolvingView")
//        }
//        NavigationLink(destination: CustomChatModal(text: Binding.constant(""), modalType: .add)) {
//            Text("CustomChatModal: add")
//        }
//        NavigationLink(destination: CustomChatModal(text: Binding.constant(""), modalType: .delete)) {
//            Text("CustomChatModal: delete")
//        }
//        NavigationLink(destination: CustomChatModal(text: Binding.constant(""), modalType: .edit)) {
//            Text("CustomChatModal: edit")
//        }
//        NavigationLink(destination: CustomProblemModal(text: Binding.constant(""), modalType: .add1)) {
//            Text("CustomProblemmodal: add1")
//        }
//        NavigationLink(destination: CustomProblemModal(text: Binding.constant(""), modalType: .add2)) {
//            Text("CustomProblemmodal: add2")
//        }
//        NavigationLink(destination: CustomProblemModal(text: Binding.constant(""), modalType: .delete)) {
//            Text("CustomProblemmodal: delete")
//        }
//        NavigationLink(destination: CustomProblemModal(text: Binding.constant(""), modalType: .edit)) {
//            Text("CustomProblemmodal: edit")
//        }
//        NavigationLink(destination: CustomSubjectModalView(text: Binding.constant(""), modalType: .add)) {
//            Text("CustomProblemmodal: add")
//        }
//        NavigationLink(destination: CustomSubjectModalView(text: Binding.constant(""), modalType: .delete)) {
//            Text("CustomSubjectmodal: delete")
//        }
//        NavigationLink(destination: CustomSubjectModalView(text: Binding.constant(""), modalType: .edit)) {
//            Text("CustomSubjectmodal: edit")
//        }
//    }
//}
