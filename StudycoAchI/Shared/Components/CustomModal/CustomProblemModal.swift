//
//  CustomProblemModal.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/24/25.
//

import SwiftUI

enum CustomProblemModalType {
    case add1
    case add2
    case edit
    case delete
}



struct CustomProblemModal: View {
    @Binding var text: String
    @State var modalType: CustomProblemModalType
    @State var selectionCount = ""
    
    
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
            if modalType == .add1 {
                setTitleView()
            }
            
            if modalType == .add2 {
                SetCountView(selectedCount: $selectionCount)
            }
            
            if modalType == .delete {
                Text("""
                    정말로 삭제 하시겠어요? 내용은 다시 복구 하실 수 없어요
                    """)
                .multilineTextAlignment(.center)
                    
            }
                
            Spacer()
                .frame(height: 20)
            if modalType != .delete  && modalType != .add2{
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
                    if modalType == .add1 {
                        self.modalType = .add2
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
        .overlay{
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray.opacity(0.1), lineWidth: 1)
                .shadow(radius: 8)
        }
        .padding()
    }
}

private struct setTitleView: View {
    var body: some View {
        VStack {
            Text("1/2")
                .foregroundStyle(.gray)
            Spacer()
                .frame(height: 20)
            Text("채팅방 추가하기")
            .font(.system(size: 18))
        }
    }
}

private struct SetCountView: View {
    let counts = ["5", "10", "15"]
    @Binding var selectedCount: String
    fileprivate var body: some View {
        VStack {
            Text("2/2")
                .foregroundStyle(.gray)
            Spacer()
                .frame(height: 20)
            Text("문제 수를 선택해주세요")
            .font(.system(size: 18))
            
            Picker("", selection: $selectedCount) {
                ForEach(counts, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.wheel)
            .frame(height: 80)
            
        }
    }
}


#Preview {
    CustomProblemModal(text: Binding.constant(""), modalType: .add2)
}
