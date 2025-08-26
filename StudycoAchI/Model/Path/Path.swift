//
//  Path.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/26/25.
//

import Foundation

class PathModel: ObservableObject {
  @Published var paths: [PathType]
  
  init(paths: [PathType] = []) {
    self.paths = paths
  }
}
