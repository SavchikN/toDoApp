//
//  DoList.swift
//  toDoApp
//
//  Created by Nikita Savchik on 02/04/2023.
//

import Foundation

struct DoList {
    var name: String
    var description: String
    var importance: Importance
    
    static func getList() -> [DoList] {
        []
    }
}

enum Importance: String {
    case light = "Low priority"
    case medium = "Medium priority"
    case high = "High priority"
}
