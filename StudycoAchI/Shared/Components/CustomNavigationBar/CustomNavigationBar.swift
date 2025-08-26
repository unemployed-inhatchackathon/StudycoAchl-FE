//
//  CustomNavigationBar.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/25/25.
//


import SwiftUI

struct CustomNavigationBar: View {
    let isDisplayLeftBtn: Bool
    let isDisplayRightBtn: Bool
    let leftBtnAction: () -> Void
    let leftBtnType: NavigationBtnType
    let rightBtnAction: () -> Void
    let rightBtnType: NavigationBtnType
    let title: String?
    init(
        isDisplayLeftBtn: Bool = true,
        isDisplayRightBtn: Bool = true,
        leftBtnAction: @escaping () -> Void = { },
        leftBtnType: NavigationBtnType = .home,
        rightBtnAction: @escaping () -> Void = { },
        rightBtnType: NavigationBtnType = .home,
        title: String? = nil
    ) {
        self.isDisplayLeftBtn = isDisplayLeftBtn
        self.isDisplayRightBtn = isDisplayRightBtn
        self.leftBtnAction = leftBtnAction
        self.leftBtnType = leftBtnType
        self.rightBtnAction = rightBtnAction
        self.rightBtnType = rightBtnType
        self.title = title
    }
    
    var body: some View {
        ZStack{
            HStack(alignment: .center  ){
                Spacer()
                    Text(title ?? "타이틀")
                Spacer()
            }
            HStack {
                
                if isDisplayLeftBtn {
                    Button(
                        action: leftBtnAction,
                        label: {
                            if leftBtnType == .home {
                                Image(systemName:"person.crop.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(.gray)
                            }
                            else {
                                Image(systemName: "chevron.left")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                    .foregroundStyle(.gray)
                            }
                        }
                    )
                }
                Spacer()
                if isDisplayRightBtn {
                    Button (
                        action: rightBtnAction, label: {
                        if rightBtnType == .home {
                            Image(systemName: "bell")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.gray)
                        }
                            else if rightBtnType == .chat {
                                Image(systemName: "book.closed")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(.gray)
                            }
                    })
                }
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
       
    }
    
}

#Preview {
    CustomNavigationBar()
}
