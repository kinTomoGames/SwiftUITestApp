//
//  ContentView.swift
//  ToDoTestApp
//
//  Created by 山本朋哉 on 2023/03/26.
//

import SwiftUI

struct BattingOrder {
    var num: Int
    var pos: String
    var name: String
}

struct ContentView: View {
    
    @State private var isToggle = false
    
    var body: some View {
        Toggle("トグル作成", isOn: $isToggle)
            .toggleStyle(TestToggleStyle())
    }
}

struct TestToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Button("イチロー") {
                configuration.isOn.toggle()
            }
            .disabled(configuration.isOn)
            
            Button("小笠原") {
                configuration.isOn.toggle()
            }
            .disabled(!configuration.isOn)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
