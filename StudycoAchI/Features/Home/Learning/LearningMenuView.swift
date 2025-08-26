//
//  LearningMenu .swift
//  StudycoAchI
//
//  Created by 어재선 on 8/11/25.
//

import SwiftUI

struct LearningMenuView: View {
    @EnvironmentObject private var pathModel: PathModel
    @EnvironmentObject private var rootViewModel: RootViewModel
    let subject: Subject
    var columns: [GridItem] = Array(repeating: .init(.flexible(),spacing: 30), count: 2)
    var body: some View {
        VStack{
            CustomNavigationBar(leftBtnAction: {
                
                rootViewModel.goBack()
            }, leftBtnType: .learning, title: "")
            Text("\(subject.title)")
                .font(.system(size: 30))
            LazyVGrid(columns: columns) {
                ForEach(LearningType.allCases) { learningType in
                    switch learningType {
                    case .data:
                        LearningCellView(learningType: .data, tapped: {

                        })
                    case .problem:
                        LearningCellView(learningType: .problem, tapped: {})
                    case .question:
                        LearningCellView(learningType: .question, tapped: {
                            rootViewModel.navigate(to: .cahtListView(subject: subject))
                        })
                    case .recording:
                        LearningCellView(learningType: .recording, tapped: {})
                    }
                }
                .padding()
            }
            Spacer()
        }
        .toolbar(.hidden, for: .tabBar)
        .padding()
    }
}


#Preview {
    LearningMenuView(subject: Subject(id: UUID().uuidString, title: ""))
}
