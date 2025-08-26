//
//  RootViewModel.swift
//  StudycoAchI
//
//  Created by 어재선 on 8/26/25.
//

import Foundation


class RootViewModel: ObservableObject {
    @Published var selectedTab: Tab
    @Published var paths: [PathType]
    
    init(selectedTab: Tab = .home, paths: [PathType] = []) {
        self.selectedTab = selectedTab
        self.paths = paths
    }
    
    // MARK: - 기본 네비게이션
    func navigate(to path: PathType) {
        paths.append(path)
    }
    
    func goBack() {
        if !paths.isEmpty {
            paths.removeLast()
        }
    }
    
    func goToRoot() {
        paths.removeAll()
        selectedTab = .home
    }
    
    func poopTo(_ targetPath:PathType) {
        if let index = paths.lastIndex(of: targetPath) {
            paths = Array(paths.prefix(through: index))
        }
    }
}
