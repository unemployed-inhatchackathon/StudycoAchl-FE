//
//  BaseTargetType.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/28/25.
//

import Foundation
import Moya

public protocol BaseTargetType: TargetType {}

extension BaseTargetType {
    public var baseURL: URL {
        return URL(string: BaseAPI.base.apiDesc)!
    }
}
