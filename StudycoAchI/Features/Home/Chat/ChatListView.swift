//
//  ChatListView.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/16/25.
//

import SwiftUI

struct ChatListView: View {
    @State private var showAlert: Bool = false
    @State private var chatText = ""
    var body: some View {
        ZStack {
            VStack {
                CustomNavigationBar(title: "과목명")
                Spacer()
                    .frame(height: 20)
                CustomAddButton(btnType: .chat) {
                    showAlert = true
                }
                
                
                // MARK: - 채팅 없을때 처리
                if false {
                    Spacer()
                        .frame(height: 100)
                    Image(systemName: "bubble")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .frame(width: 80, height: 80)
                        .padding()
                    Text("아직 채팅방이  없어요")
                        .font(.system(size: 24))
                    Text("새로운 질문으로 첫 채팅을 시작하세요.")
                        .foregroundStyle(.gray)
                } else {
                    List {
                        ForEach(0..<5) { _ in
                            
                            ChatListCellView(title: "채팅방")
                        }
                    }
                    .listStyle(.plain)
                }
                
                Spacer()
            }
            .padding()
            
            if showAlert {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showAlert = false
                    }
                CustomChatModal(
                    text: $chatText,
                    modalType: .add
                )
                .transition(.scale.combined(with: .opacity))
            }
        }
        .animation(.spring(duration: 0.3), value: showAlert)
    }
}


private struct ChatListCellView: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
            Spacer()
        }
        .padding(.vertical,8)
    }
}

#Preview {
    ChatListView()
}
