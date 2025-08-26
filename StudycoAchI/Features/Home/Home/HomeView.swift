//
//  HomeView.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/6/25.
//

import SwiftUI

struct HomeView: View {
    @State var showAlert: Bool = false
    @State var alertType: SubjectModalType = .add
    @State var subjectTitle: String = ""
    var body: some View {
        ZStack {
            VStack {
                CustomNavigationBar(title: "")
                Spacer()
                    .frame(height: 20)
                ScrollView{
                    // 헤더
                    HomeHeader()
                    Spacer()
                        .frame(height: 26)
                    // 과목 추가 버튼
                    CustomAddButton(btnType: .subject, btnAction: {
                        showAlert = true
                        alertType = .add
                    })
                    Spacer()
                        .frame(height: 26)
                    // 과목 리스트
                    ForEach(0..<5) { _ in
                        SubjectCellView(title: "과목명")
                            .contextMenu{
                                Text("과목명")
                                Button {
                                    alertType = .edit
                                    showAlert = true
                                   
                                } label: {
                                    Text("수정")
                                }
                                Button {
                                    alertType = .delete
                                    showAlert = true
                                    
                                } label: {
                                    Text("삭제")
                                }
                            }
                            .padding(.vertical, 8)
                    }
                    
                    Spacer()
                }
                .padding(16)
                
                
            }
            if showAlert {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showAlert = false
                    }
                
                // 커스텀 알럿
                CustomSubjectModalView(text: $subjectTitle, modalType: alertType, xButtonAction: { showAlert = false })
                    .transition(.scale.combined(with: .opacity))
            }
            
        }
        .animation(.spring(duration: 0.3), value: showAlert)
        .onDisappear {
            showAlert = false
        }
    }
}



//MARK: - HomeHeader
struct HomeHeader: View {
    var body: some View {
        HStack {
            Text("어떤 공부를 시작할까요?")
                .font(.system(size: 24))
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
