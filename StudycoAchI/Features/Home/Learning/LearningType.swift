//
//  LearningType .swift
//  StudycoAchI
//
//  Created by 어재선 on 8/11/25.
//

import Foundation

enum LearningType :String, CaseIterable,Identifiable {
    var id: Self { self }
    
    case question = "questionmark.bubble.fill"
    case data = "text.book.closed.fill"
    case problem = "checkmark.rectangle.fill"
    case recording = "microphone.fill"
    
}
