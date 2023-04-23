//
//  Draft.swift
//  SwiftUITodoApp
//
//  Created by 山本朋哉 on 2023/04/23.
//

import SwiftUI

struct Draft: View {
    @State var taskName = ""
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        TextField("タスクを入力してください", text: $taskName)
            .onSubmit {
                createTask()
                self.userData.isEditing = false
            }
    }
    
    func createTask() {
        let newTask = TaskInfo(isComplete: false, taskName: taskName)
        self.userData.taskList.insert(newTask, at: 0)
        self.taskName = ""
    }
}

struct Draft_Previews: PreviewProvider {
    static var previews: some View {
        Draft()
    }
}
