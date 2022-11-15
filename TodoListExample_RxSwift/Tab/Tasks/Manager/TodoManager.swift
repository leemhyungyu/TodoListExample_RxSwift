//
//  TodoManager.swift
//  TodoListExample_RxSwift
//
//  Created by 임현규 on 2022/11/15.
//

import Foundation

class TodoManager {
    
    static let shard = TodoManager()
    
    static var lastId = 0
    
    var todos = [Todo]()
}
