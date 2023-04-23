//
//  ListRow.swift
//  SwiftUITodoApp
//
//  Created by 山本朋哉 on 2023/04/23.
//

import SwiftUI

struct ListRow: View {
    let taskName: String
    var isComplete: Bool
    
    var body: some View {
        HStack {
            if (isComplete) {
                Text("✔︎")
                Text(taskName)
                    .strikethrough()
                    .fontWeight(.ultraLight)
            } else {
                Text("□")
                Text(taskName)
            }
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(taskName: "テスト名", isComplete: true)
    }
}
