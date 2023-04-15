//
//  UserData.swift
//  ToDoTestApp
//
//  Created by 山本朋哉 on 2023/04/10.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var name: String
    @Published var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
