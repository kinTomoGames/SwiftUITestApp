//
//  ContentView.swift
//  SwiftUITodoApp
//
//  Created by 山本朋哉 on 2023/04/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) var taskInfoListDb: FetchedResults<TaskData>
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userData.taskList) { task in
                    Button(action: {
                        guard let index = self.userData.taskList.firstIndex(of: task) else {
                            return
                        }
                        // DBを更新する
                        self.updateTask(index: index)
                    }) {
                        ListRow(taskName: task.taskName,
                                isComplete: task.isComplete)
                    }
                }
                
                if (self.userData.isEditing) {
                    Draft()
                } else {
                    Button(action: {
                        self.userData.isEditing = true
                    }) {
                        Text("＋")
                    }
                    .font(.title)
                }
            }
            .navigationBarTitle(Text("タスク"))
            .navigationBarItems(trailing: Button("Delete") {
                // 削除処理
                deleteTask()
            })
            .onAppear() {
                self.initTaskInfoList()
            }
        }
    }
    
    /**
     * タスク情報をDBから取得し、初期化する
     */
    func initTaskInfoList() {
        for taskInfoDb in taskInfoListDb {
            print("init isComplete:\(taskInfoDb.isComplete)")
            let taskInfo: TaskInfo = TaskInfo(isComplete: taskInfoDb.isComplete, taskName: taskInfoDb.taskName ?? "Unknown")
            self.userData.taskList.insert(taskInfo, at: 0)
        }
    }
    
    /**
     * タスク情報を更新する
     */
    func updateTask(index: Int) {
        self.userData.taskList[index].isComplete.toggle()
        
        let dbCount = self.taskInfoListDb.count - 1
        self.taskInfoListDb[dbCount - index].isComplete.toggle()
        
        do {
            try viewContext.save()
        } catch {
            fatalError("Failed update save")
        }
    }
    
    /**
     * タスク情報を削除する
     */
    func deleteTask() {
        // 残タスク取得
        let remainingTask = self.userData.taskList.filter({ !$0.isComplete })
        // 残タスクにUIを更新する
        self.userData.taskList = remainingTask
        
        // 完了状態のタスクをDBから削除
        for taskInfo in taskInfoListDb {
            if (taskInfo.isComplete) {
                print("delete:\(taskInfo.taskName ?? "not")")
                viewContext.delete(taskInfo)
            }
        }
        
        do {
            try viewContext.save()
        } catch {
            fatalError("Failed delete save")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}
