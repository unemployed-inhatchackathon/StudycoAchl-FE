//
//  subjectListView.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/6/25.
//

import SwiftUI

struct SubjectCellView: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 24))
            Spacer()
                
        }
        .padding(.vertical, 27.5)
        .padding(.horizontal, 16)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray.opacity(0.4), lineWidth: 1)
        )
        .padding(.vertical, 10)
    }
}

#Preview {
    SubjectCellView(title: "과목 명")
}
