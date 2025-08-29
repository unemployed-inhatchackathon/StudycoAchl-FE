//
//  PathType.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/26/25.
//

import Foundation

enum PathType: Hashable {
    case learningMenuView(subject: SubjectResponse)
    case cahtListView(subject: SubjectResponse)
    case chatDetailView(room: ChatRoom)
    
    
    
    
}
