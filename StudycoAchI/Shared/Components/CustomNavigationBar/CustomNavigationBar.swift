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
    let isMainTitle: Bool
    let leftBtnAction: () -> Void
    let rightBtnAction: () -> Void
    let rightBtnType: NavigationBtnType
    let title: String?
    init(
        isDisplayLeftBtn: Bool = true,
        isDisplayRightBtn: Bool = true,
        isMainTitle: Bool = true,
        leftBtnAction: @escaping () -> Void = { },
        rightBtnAction: @escaping () -> Void = { },
        rightBtnType: NavigationBtnType = .home,
        title: String? = nil
    ) {
        self.isDisplayLeftBtn = isDisplayLeftBtn
        self.isDisplayRightBtn = isDisplayRightBtn
        self.isMainTitle = isMainTitle
        self.leftBtnAction = leftBtnAction
        self.rightBtnAction = rightBtnAction
        self.rightBtnType = rightBtnType
        self.title = title
    }
    
    var body: some View {
        ZStack{
            HStack(alignment: .center  ){
                Spacer()
                if isMainTitle {
                    Text("마음 채비")
                        .font(.system(size: 20, weight: .bold))
                } else {
                    Text(title ?? "타이틀")
                }
                Spacer()
            }
            HStack {
                
                if isDisplayLeftBtn {
                    Button(
                        action: leftBtnAction,
                        label: { Image(systemName: "chevron.left")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                                .foregroundStyle(.gray)
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
        .padding(.leading, 8)
        .padding(.trailing, 8)
       
    }
    
}

#Preview {
    CustomNavigationBar()
}
