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
    
    @State private var battingOrderDataList: [BattingOrder] = [
        BattingOrder(num: 1, pos: "センター", name: "イチロー"),
        BattingOrder(num: 2, pos: "セカンド", name: "山田 哲人"),
        BattingOrder(num: 3, pos: "ファースト", name: "小笠原 道大"),
        BattingOrder(num: 4, pos: "DH", name: "大谷 翔平"),
        BattingOrder(num: 5, pos: "サード", name: "村上 宗隆"),
        BattingOrder(num: 6, pos: "センター", name: "松井 秀喜"),
        BattingOrder(num: 7, pos: "ショート", name: "坂本 隼人"),
        BattingOrder(num: 8, pos: "レフト", name: "吉田 正尚"),
        BattingOrder(num: 9, pos: "キャッチャー", name: "古田 敦也")]
    
    @State private var textFieldTest: String = ""
    
    @ObservedObject var userData = UserData(name: "田中", age: 20)
    
    @State private var isShowingSheet = false
    
    var body: some View {
        Toggle("トグルのテキスト", isOn: $isShowingSheet)
            .padding(10)
            .disabled(isShowingSheet)
        
//        Button(action: {
//            isShowingSheet = true
//        }) {
//            Text("テスト用のシート表示")
//        }
        .sheet(isPresented: $isShowingSheet, content: {
            testSheet(isShowingSheet: $isShowingSheet)
        })
    }
}

struct testSheet: View {
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        Text(isShowingSheet.description)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
