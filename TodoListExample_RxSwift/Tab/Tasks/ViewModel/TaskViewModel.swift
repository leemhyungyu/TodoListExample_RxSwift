//
//  TaskViewModel.swift
//  TodoListExample_RxSwift
//
//  Created by 임현규 on 2022/11/14.
//

import Foundation

enum todoSection: CaseIterable {
    case today
    case upcoming
    
    var title: String {
        switch self {
        case .today:
            return "Today"
        case .upcoming:
            return "Upcoming"
        }
    }
}

class TaskViewModel {
    
    var section: [todoSection] = [.today, .upcoming]

    var numOfsection: Int {
        return section.count
    }
    func sectionTitle(sectionNum: Int) -> String {
        return self.section[sectionNum].title
    }
}
