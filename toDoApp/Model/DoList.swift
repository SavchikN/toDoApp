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

struct Importance {
    var low: String
    var medium: String
    var high: String
}
