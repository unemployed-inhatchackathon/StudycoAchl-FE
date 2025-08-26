//
//  ProblemDetailView.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/25/25.
//

import SwiftUI

struct ProblemSolvingView: View {
    @State var selected: Int = 0
    var body: some View {
        ScrollView {
            // TODO: - 문제
            ProblemView(text: """
    1.문제내용 문제내용 문제내용 문제내용 문제내용 문제내용 문제내용 문제내용 문제내용 문제내용 문제내용 문제내용 문제내용 문제내용 문제내용 문제내용 문제내용 문제내용 문제내용 문제내용 
    """)
            
            Spacer()
                .frame(height: 40)
            // TODO: - 보기
            ForEach(1..<5) {
                AnswerButton(text: "\($0) 보기",index: $0, seleced: $selected)
            }
            
            
        }
        .padding()

    
    }
}

private struct ProblemView: View {
    let text: String
    fileprivate var body: some View {
        
        Text(text)
            .font(.system(size: 16))
            .bold()
            .multilineTextAlignment(.leading)
        
        
        
    }
}


private struct AnswerButton: View {
    let text: String
    let index: Int
    @Binding var seleced: Int
    fileprivate var body: some View {
        HStack {
            Spacer()
            Text(text)
                .font(.system(size: 15))
                .foregroundStyle(seleced != index ? Color.black : Color.blue.opacity(1))
            Spacer()
        }
        .padding()
        .background(seleced != index ? Color.white : Color.blue.opacity(0.05))
        .cornerRadius(8, corners: .allCorners)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray.opacity(0.7), lineWidth: 1)
        }
        .onTapGesture {
            print("\(text)클릭")
            
            seleced = index
            print("\(seleced)")
        }
        .padding(5)
        
        
    }
}


#Preview {
    ProblemSolvingView()
}
