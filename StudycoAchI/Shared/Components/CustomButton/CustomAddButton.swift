//
//  AddButton.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/6/25.
//

import SwiftUI

struct CustomAddButton: View {
    let btnType: CustomAddButtonType
    let btnAction: () -> Void
    var body: some View {
        Button(
            action: {
                btnAction()
            },
            label: {
                HStack{
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        
                    Text(btnType.rawValue)
                        .padding(10)
                    Spacer()
                }
            }
        )
        .padding(16)
        .overlay(
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(.blue)
                    .opacity(0.1)
                RoundedRectangle(cornerRadius: 30)
                    .stroke(.gray, lineWidth: 1)
            }
        )
        .padding(16)
        
        
    }
}

#Preview {
    CustomAddButton(btnType: .chat, btnAction: {})
}
