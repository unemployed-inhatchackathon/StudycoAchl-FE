//
//  PathType.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/26/25.
//

import Foundation

enum PathType: Hashable {
    case learningMenuView(subject: String)
    case cahtListView
    case chatDetailView(id: UUID)
    
    
    
    
}
