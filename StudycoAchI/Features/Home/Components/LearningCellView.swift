//
//  LearningCellView.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/11/25.
//

import SwiftUI

struct LearningCellView: View {
    let learningType: LearningType
    let tapped: () -> Void
    var body: some View {
        VStack(
            alignment: .center
        ) {
            Image(systemName: learningType.rawValue)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundStyle(.blue)
            switch learningType {
            case .question:
                Text("질문하며 배우기")
            case .data:
                Text("자료로 문제풀기")
                
            case .problem:
                Text("모의고사 풀기")
                
            case .recording:
                Text("수업내용 자료 만들기")

            }
        }
        .padding()
        .font(.system(size: 25))
        .multilineTextAlignment(.center)
        .frame(width: 160,height: 160)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray, lineWidth: 1)
            
        }
        .onTapGesture {
            tapped()
        }
        
    }
}

#Preview {
    LearningCellView(learningType: .recording, tapped: { })
}
