//
//  Persistent.swift
//  SwiftUITodoApp
//
//  Created by 山本朋哉 on 2023/04/25.
//

import CoreData

struct PersistenceController {
    let container: NSPersistentContainer
    
    init() {
        // CoreDataのモデルファイル名からコンテナーを取得する
        container = NSPersistentContainer(name: "CoreDataModel")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // アプリを落とす処理
                fatalError("Unresolved error \(error)")
            }
        })
    }
}
