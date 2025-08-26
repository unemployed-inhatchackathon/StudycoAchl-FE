//
//  LearningMenu .swift
//  StudycoAchI
//
//  Created by 어재선 on 8/11/25.
//

import SwiftUI

struct LearningMenuView: View {
    var columns: [GridItem] = Array(repeating: .init(.flexible(),spacing: 30), count: 2)
    var body: some View {
        VStack{
            CustomNavigationBar(leftBtnAction: {}, leftBtnType: .learning, title: "")
            Text("과목명")
                .font(.system(size: 30))
            LazyVGrid(columns: columns) {
                ForEach(LearningType.allCases) { learningType in
                    switch learningType {
                    case .data:
                        LearningCellView(learningType: .question, tapped: {})
                    case .problem:
                        LearningCellView(learningType: .data, tapped: {})
                    case .question:
                        LearningCellView(learningType: .problem, tapped: {})
                    case .recording:
                        LearningCellView(learningType: .recording, tapped: {})
                    }
                }
                .padding()
            }
            Spacer()
        }
        .padding()
    }
}


#Preview {
    LearningMenuView()
}
