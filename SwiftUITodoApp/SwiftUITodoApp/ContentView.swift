//
//  ContentView.swift
//  SwiftUITodoApp
//
//  Created by 山本朋哉 on 2023/04/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userData.taskList) { task in
                    Button(action: {
                        guard let index = self.userData.taskList.firstIndex(of: task) else {
                            return
                        }
                        
                        self.userData.taskList[index].isComplete.toggle()
                    }) {
                        ListRow(taskName: task.taskName, isComplete: task.isComplete)
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
            .navigationBarTitle(Text("テスト"))
            .navigationBarItems(trailing: Button("Delete") {
                // 削除処理
                DeleteTask()
            })
        }
    }
    
    func DeleteTask() {
        let remainingTask = self.userData.taskList.filter({ !$0.isComplete })
        self.userData.taskList = remainingTask
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}
