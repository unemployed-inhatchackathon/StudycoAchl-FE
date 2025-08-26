//
//  HomeView.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/6/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel
    @EnvironmentObject private var pathModel: PathModel
    @EnvironmentObject private var rootViewModel: RootViewModel
    
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
                        homeViewModel.alertType = .add
                        homeViewModel.isShowAlert = true
                        
                    })
                    Spacer()
                        .frame(height: 26)
                    // 과목 리스트
                    ForEach(homeViewModel.subjects, id: \.id) { subject in
                        SubjectCellView(title: subject.title)
                            .contextMenu{
                                Text("\(subject.title)")
                                Button {
                                    homeViewModel.alertType = .edit
                                    homeViewModel.isShowAlert = true
                                    homeViewModel.selectedSubject = subject
                                   
                                } label: {
                                    Text("수정")
                                }
                                Button {
                                    homeViewModel.alertType = .delete
                                    homeViewModel.isShowAlert = true
                                    homeViewModel.selectedSubject = subject
                                    
                                } label: {
                                    Text("삭제")
                                }
                            }
                            .padding(.vertical, 8)
                            .onTapGesture {
                                print("눌림")
                                rootViewModel.navigate(to: .learningMenuView(subject: subject))
                            
                            }
                        
                    }
                    
                    Spacer()
                }
                .padding(16)
                
                
            }
            if homeViewModel.isShowAlert {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        homeViewModel.dismissAlert()
                    }
                
                // 커스텀 알럿
                CustomSubjectModalView(
                    text: $homeViewModel.newSubjectName,
                    modalType: homeViewModel.alertType,
                    xButtonAction: { homeViewModel.dismissAlert() },
                    addButtonAction: { homeViewModel.addSubject()},
                    cancelButtonAction: {homeViewModel.dismissAlert()},
                    deleteButtonAction: {homeViewModel.deleteSubject(homeViewModel.selectedSubject?.id  ?? UUID().uuidString)},
                    editButtonAction: {homeViewModel.editSubject( homeViewModel.selectedSubject?.id ?? UUID().uuidString, newTitle: homeViewModel.newSubjectName)}
                )
                    .transition(.scale.combined(with: .opacity))
            }
            
        }
        .animation(.spring(duration: 0.3), value: homeViewModel.isShowAlert)
        .onDisappear {
            homeViewModel.dismissAlert()
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
