//
//  CustomModal.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/12/25.
//

import SwiftUI

enum SubjectModalType {
    case add
    case edit
    case delete
}

struct CustomSubjectModalView: View {
    @Binding var text: String
    let modalType: SubjectModalType
    let xButtonAction: () -> Void
    let addButtonAction: () -> Void
    let cancelButtonAction: () -> Void
    let deleteButtonAction: () -> Void
    let editButtonAction: () -> Void
    var body: some View {
            
            VStack {
                HStack {
                    Spacer()
                    Button{
                        xButtonAction()
                    }label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.black)
                    }
                }
                Spacer()
                    .frame(height: 20)
                
                if modalType == .edit {
                    Text("과목 수정하기")
                        .font(.system(size: 18))
                }
                if modalType == .add {
                    Text("과목 추가하기")
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
                        if modalType == .add {
                            addButtonAction()
                        } else {
                            editButtonAction()
                        }
                        
                        
                    } label: {
                        Spacer()
                        Text("학인")
                        Spacer()
                    }
                    .buttonStyle(.borderedProminent)

                } else {
                    HStack {
                        Button{
    
                            deleteButtonAction()
                        } label: {
                            Spacer()
                            Text("삭제하기")
                            Spacer()
                        }
                        .buttonStyle(.borderedProminent)
                        Button{
                            
                            cancelButtonAction()
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
    CustomSubjectModalView(text: Binding.constant(""), modalType: .delete, xButtonAction: {}, addButtonAction: {}, cancelButtonAction: {},deleteButtonAction: {}, editButtonAction: {})
}
