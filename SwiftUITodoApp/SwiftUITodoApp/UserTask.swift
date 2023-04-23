//
//  UserTask.swift
//  SwiftUITodoApp
//
//  Created by 山本朋哉 on 2023/04/23.
//

import SwiftUI

struct TaskInfo : Identifiable, Equatable {
    let id = UUID()
    var isComplete: Bool
    let taskName: String
    
    init(isComplete: Bool, taskName: String) {
        self.isComplete = isComplete
        self.taskName = taskName
    }
}
