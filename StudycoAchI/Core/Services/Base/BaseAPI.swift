//
//  BaseAPPI.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/28/25.
//

import Foundation

public enum BaseAPI: String {
    case base
    
    public var apiDesc: String {
        switch self {
        case .base:
            return "https://hackathon-api-188578555040.asia-northeast3.run.app"
        }
    }
}
