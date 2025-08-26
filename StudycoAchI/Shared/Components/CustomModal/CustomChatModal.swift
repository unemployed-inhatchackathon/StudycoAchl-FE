//
//  CustomChatModal.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/19/25.
//

import SwiftUI

enum CustomChatModalType {
    case add
    case edit
    case delete
}

struct CustomChatModal: View {
    @Binding var text: String
    let modalType: CustomChatModalType
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                }
            }
            Spacer()
                .frame(height: 20)
            
            if modalType == .edit {
                Text("채팅방 수정하기")
                    .font(.system(size: 18))
            }
            if modalType == .add {
                Text("채팅방 추가하기")
                .font(.system(size: 18))
            }
            
            if modalType == .delete {
                Text("""
                    정말로 삭제 하시겠어요? 내용은 다시 복구 하실 수 없어요
                    """)
                .multilineTextAlignment(.center)
                    
            }
                
            Spacer()
                .frame(height: 20)
            if modalType != .delete {
                TextField(text: $text) {
                    Text("제목을 입력해주세요.")
                }
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray, lineWidth: 1)
                }
            }
            
            
            Spacer()
                .frame(height: 20)
           
            if modalType != .delete {
                Button{
                    
                } label: {
                    Spacer()
                    Text("학인")
                    Spacer()
                }
                .buttonStyle(.borderedProminent)

            } else {
                HStack {
                    
                    Button{

                    } label: {
                        Spacer()
                        Text("삭제하기")
                        Spacer()
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button{
                        
                    } label: {
                        Spacer()
                        Text("취소")
                        Spacer()
                    }
                    .buttonStyle(.bordered)

                }
            }
                            
            Spacer()
                .frame(height: 20)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16, corners: .allCorners)
        .overlay{
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray.opacity(0.1), lineWidth: 1)
                .shadow(radius: 8)
        }
        .padding()
    }
}

#Preview {
    CustomChatModal(text: Binding.constant(""), modalType: .add)
}
