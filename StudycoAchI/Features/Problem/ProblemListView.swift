//
//  ProblemView.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/24/25.
//

import SwiftUI


struct ProblemListView: View {
    var body: some View {
        ScrollView {
            ProblemAddButton()
            
            Spacer()
                .frame(height: 20)
            ProblemListCellView(title: "123", deta: "!23", action: { print("화면 클릭")})
        }
        .padding()
        .background(.gray.opacity(0.1))
        
    }
}

private struct ProblemAddButton: View {
    fileprivate var body: some View {
        Button {
            
        } label: {
            HStack {
                Spacer()
                Image(systemName: "plus")
                Text("새 문제 만들기")
                    .font(.system(size: 24))
                Spacer()
            }
            .foregroundStyle(.white)
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(16, corners: [.allCorners])
    }
}


private struct ProblemListCellView: View {
    let title: String
    let deta: String
    let action: () -> Void
    fileprivate var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 24))
                Text(deta)
                    .font(.system(size: 12))
                    .foregroundStyle(.gray)
            }
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        .padding()
        .background(.white)
        .cornerRadius(16, corners: .allCorners)
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    ProblemListView()
}
