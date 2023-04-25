//
//  Draft.swift
//  SwiftUITodoApp
//
//  Created by 山本朋哉 on 2023/04/23.
//

import SwiftUI
import CoreData

struct Draft: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) var taskInfoListDb: FetchedResults<TaskData>
    
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
        self.addDbTaskInfo(taskInfo: newTask)
        self.taskName = ""
    }
    
    func addDbTaskInfo(taskInfo: TaskInfo) {
        let taskData = TaskData(context: viewContext)
        
        taskData.taskName = taskInfo.taskName
        taskData.isComplete = taskInfo.isComplete
        
        do {
            try viewContext.save()
        } catch {
            fatalError("Failed DB save")
        }
    }
}

struct Draft_Previews: PreviewProvider {
    static var previews: some View {
        Draft()
    }
}
