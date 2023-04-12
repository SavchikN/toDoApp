//
//  DoList.swift
//  toDoApp
//
//  Created by Nikita Savchik on 02/04/2023.
//

import UIKit

struct DoList {
    var name: String
    var description: String
    var status: UIColor
    
    static func getList() -> [DoList] {
        []
    }
    
    static func getStatus(status: UIColor) -> UIImage {
        if status == #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1) {
            return UIImage(named: "green")!
        } else if status == #colorLiteral(red: 0.9972404838, green: 0.498265624, blue: 0, alpha: 1) {
            return UIImage(named: "orange")!
        } else if status == #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1) {
            return UIImage(named: "red")!
        } else {
            return UIImage(named: "green")!
        }
            
    }
}

