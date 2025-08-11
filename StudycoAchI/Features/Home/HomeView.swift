//
//  HomeView.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/6/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView{
            // 헤더
            HomeHeader()

            Spacer()
                .frame(height: 26)

            // 과목 추가 버튼
            CustomAddButton(btnType: .subject, btnAction: {})

            Spacer()
                .frame(height: 26)
            
            // 과목 리스트
            ForEach(0..<5) { _ in
                SubjectCellView(title: "과목명")
            }
            
            Spacer()
        }
        .padding(16)
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
