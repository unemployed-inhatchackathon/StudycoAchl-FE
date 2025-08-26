//
//  ChatListView.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/16/25.
//

import SwiftUI

struct ChatListView: View {
    @EnvironmentObject private var chatManager: ChatroomManager
    @EnvironmentObject private var pathModel: PathModel
    @EnvironmentObject private var rootViewModel: RootViewModel
    
    let subject: Subject
    @State private var showAlert: Bool = false
    @State private var newChatTitle = ""
    @State private var selectRoomId: String?
    @State private var modalType: CustomChatModalType = .add

    var body: some View {
        ZStack {
            VStack {
                CustomNavigationBar(leftBtnAction: {
                    rootViewModel.goBack()
                }, leftBtnType: .chatList, title: subject.title)
                Spacer()
                    .frame(height: 20)
                CustomAddButton(btnType: .chat) {
                    modalType = .add
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
                        ForEach(chatManager.chatRooms,id: \.id) { room in
                            if subject.title == room.subjectName {
                                ChatListCellView(title: room.title)
                                    .contextMenu{
                                        Text("\(subject.title)")
                                        Button {
                                            modalType = .edit
                                            showAlert = true
                                            selectRoomId = room.id
                                           
                                        } label: {
                                            Text("수정")
                                        }
                                        Button {
                                            modalType = .delete
                                            showAlert = true
                                            selectRoomId = room.id
                                            
                                        } label: {
                                            Text("삭제")
                                        }
                                    }
                                    .padding(.vertical, 8)
                                    .onTapGesture {
                                        print("눌림")
                                        rootViewModel.navigate(to: .chatDetailView(room: room))
                                    }
                            }
                           
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
                    text: $newChatTitle, checkButtonAction: {
                        _ = chatManager.createNewChatRoom(title: newChatTitle.isEmpty ? nil : newChatTitle, subjectName: subject.title)
                        newChatTitle = ""
                    }, deleteButtonAction: {chatManager.deleteChatRoom(selectRoomId ?? "")}, isShowAlert: $showAlert, modalType: modalType
                )
                .transition(.scale.combined(with: .opacity))
            }
        }
        .animation(.spring(duration: 0.3), value: showAlert)
        .toolbar(.hidden, for:.tabBar)
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
    ChatListView(subject: Subject(id: UUID().uuidString, title: ""))
        .environmentObject(PathModel())
        .environmentObject(ChatroomManager())
        .environmentObject(RootViewModel())
}
