//
//  ChatView.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/19/25.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatManager: ChatroomManager
    let room: ChatRoom
    @EnvironmentObject private var rootViewModel: RootViewModel
    
    @State var currentMessage: String = ""
    @State var messages: [(text: String, isUser: Bool)] = []
    @State var isLoading: Bool = false
    
    
    var body: some View {
        
        VStack {
            CustomNavigationBar(
                isDisplayLeftBtn: true,
                isDisplayRightBtn: true,
                leftBtnAction: {rootViewModel.goBack()},
                leftBtnType: .chat,
                rightBtnAction: {},
                rightBtnType: .chat,
                title: room.title
            )
            ScrollViewReader { proxy in
                
                
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(messages.indices, id: \.self) { index in
                            let message = messages[index]
                            
                            HStack {
                                if message.isUser {
                                    Spacer()
                                    UserMessageBox(content: message.text)
                                } else {
                                    AiMessageBox(content: message.text)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                }
                .onChange(of: messages.count) { _ in
                    withAnimation(.easeOut(duration: 0.3)) {
                        proxy.scrollTo(messages.count - 1, anchor: .bottom)
                    }
                }
                
                if isLoading {
                    HStack {
                        ProgressView()
                            .scaleEffect(0.7)
                        Text("답변 생성 중...")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    .padding()
                }
                
//                HStack {
//                    TextField("메시지를 입력하세요...", text: $currentMessage)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .disabled(isLoading)
//                        .onSubmit {
//                            sendMessage()
//                        }
//                    
//                    Button("전송") {
//                        sendMessage()
//                    }
//                    .disabled(currentMessage.isEmpty || isLoading)
//                }
//                .padding()
                    InputUI(text: $currentMessage,enter: {sendMessage()}, isDisabled: currentMessage.isEmpty || isLoading)
                        
                    
                
            }
        }
        .onAppear{
            loadChatHistory()
            chatManager.selectChatRoom(room.id)
        }
        .toolbar(.hidden, for:.tabBar)
    }
    
    private func loadChatHistory() {
        chatManager.selectChatRoom(room.id)
        let history = chatManager.getCurrentChatHistory()
        messages = history.map { message in
            (text: message.content, isUser: message.role == "user")
        }
    }
    
    private func sendMessage() {
        guard !currentMessage.isEmpty else { return }
        
        let message = currentMessage
        currentMessage = ""
        
        // 사용자 메시지 추가
        messages.append((text: message, isUser: true))
        isLoading = true
        
        // AI에게 메시지 전송
        chatManager.sendMessage(message) { response in
            DispatchQueue.main.async {
                isLoading = false
                let aiResponse = response ?? "죄송합니다. 답변을 생성할 수 없습니다."
                messages.append((text: aiResponse, isUser: false))
            }
        }
    }
    
}


private struct InputUI: View {
    @Binding var text: String
    let enter: () -> Void
    var isDisabled: Bool
    var body: some View {
        
        VStack {
            Divider()
            HStack{
                MenuButtonView()
                ZStack {
                    if text.isEmpty {
                        HStack{
                            Text("무엇이든 질문하세요.")
                                .font(.system(size: 20))
                                .foregroundStyle(.black.opacity(0.5))
                                .padding(8)
                            Spacer()
                        }
                        
                    }
                    TextField("" ,text: $text)
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 20))
                        .padding(8)
                        .accentColor(.gray)
                        .onSubmit {
                            enter()
                        }
                }.overlay{
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(.gray.opacity(0.5),lineWidth: 1)
                }
                
                
                Button{
                    //TODO: - 보내기 버튼 액션 추가
                    enter()
                } label: {
                    Image(systemName:"arrowshape.up.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                }
                .padding(.leading, 8)
                .disabled(isDisabled)
            }
            .background(.clear)
            
            .cornerRadius(32)
            .padding(.horizontal)
            .padding(.vertical,4)
        }
        
    }
}

private struct AiMessageBox: View {
    var content: String
    fileprivate var body: some View {
        VStack {
            Text(content)
                .foregroundStyle(.black)
                .padding(8)
            
        }
    }
}

private struct UserMessageBox: View {
    var content: String
    fileprivate var body: some View {
        HStack{
            Spacer()
            VStack(alignment: .leading){
                Text(content)
                    .foregroundStyle(.black)
                    .padding(8)
                    .background(.blue.opacity(0.2))
                    .cornerRadius(8,corners: [.topLeft, .topRight, .bottomLeft])
            }.padding()
        }
    }
}


private struct MenuButtonView: View {
    
    fileprivate var body: some View {
        Menu {
            Button{
                
            } label:{
                Label("카메라",systemImage: "camera.fill")
            }
            Button{
                
            } label:{
                Label("사진",systemImage: "photo.fill")
            }
            Button{
                
            } label:{
                Label("학습자료",systemImage: "text.book.closed.fill")
            }
            Button{
                
            } label:{
                Label("녹음자료",systemImage: "microphone.fill")
            }
            Button{
                
            } label:{
                Label("파일",systemImage: "folder.fill")
            }
            
            
            
            //TODO: - Plus 버튼 눌렀을 때 액션 추가
        } label: {
            Image(systemName: "plus")
                .resizable()
                .foregroundStyle(.blue)
                .scaledToFit()
                .frame(width: 16)
                .padding(8)
            
        }
    }
}
