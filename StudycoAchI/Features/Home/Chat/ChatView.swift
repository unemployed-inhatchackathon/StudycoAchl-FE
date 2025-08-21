//
//  ChatView.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/19/25.
//

import SwiftUI

struct ChatView: View {
    @State var text: String = ""
    var body: some View {
        
        ZStack {
            ScrollView {
                
            
                UserMessageBox(content: "안녕하세요.")
                AiMessageBox(content: "안녕하세요. 저는 어재선입니다.")
            }
            VStack {
                Spacer()
                InputUI(text: $text)
            }
            
        }
       
    }
}


private struct InputUI: View {
    @Binding var text: String
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
                }.overlay{
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(.gray.opacity(0.5),lineWidth: 1)
                }
                
                
                Button{
                    //TODO: - 보내기 버튼 액션 추가
                } label: {
                    Image(systemName:"arrowshape.up.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                }
                .padding(.leading, 8)
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
#Preview {
    ChatView()
}
