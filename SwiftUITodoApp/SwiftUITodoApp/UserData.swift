//
//  UserData.swift
//  SwiftUITodoApp
//
//  Created by 山本朋哉 on 2023/04/23.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var taskList: [TaskInfo] = []
    
    @Published var isEditing: Bool = false
}
