//
//  ToDoTestAppApp.swift
//  ToDoTestApp
//
//  Created by 山本朋哉 on 2023/03/26.
//

import SwiftUI

@main
struct ToDoTestAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(battingOrderData: BattingOrder(num: 10, pos: "ピッチャー", name: "大谷 翔平"))
        }
    }
}
