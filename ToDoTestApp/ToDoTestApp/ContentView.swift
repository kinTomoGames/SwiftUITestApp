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
    
    init(battingOrderData: BattingOrder) {
        print("\(battingOrderData.num)")
        battingOrderDataList.append(battingOrderData)
    }
    
    var body: some View {
        VStack {
            TextField("テストですよー", text: $textFieldTest)
                .onSubmit {
                    textFieldTest = ""
                    print("エンターが押されたよ")
                }
                .padding(50)
            
            Image(textFieldTest)
                .resizable()
                .frame(height: 300, alignment: .center)
            
            
            ForEach(battingOrderDataList, id: \.num) { data in
//                Text("\(num)番目")
                Button(action: {
                    // ボタンを押下した場合
                    print("\(data.num)")
                }) {
                    Text("\(data.num)番 \(data.pos) \(data.name)")
                }
            }
        }
        
//        List {
//            Text("小笠原")
//                .padding()
//            Text("松坂")
//                .padding()
//                .foregroundColor(Color.red)
//                .font(Font.headline)
//        }
        
//        NavigationView {
//            Text("テキスト")
//                .navigationBarItems(leading: Image(systemName: "globe").foregroundColor(.accentColor))
//        }
    }
}

func Report() {
    print("押された？")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(battingOrderData: BattingOrder(num: 10, pos: "ピッチャー", name: "大谷 翔平"))
    }
}
