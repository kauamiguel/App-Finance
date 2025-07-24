//
//  Category.swift
//  Finance
//
//  Created by Kaua Miguel on 23/07/25.
//

import Foundation

struct Category{
    var id = UUID()
    var name:String
    var imageUrl:String
    var expenses : [Expense] = []
    
    static let defaultCategories : [Category] = [
        Category(name: "food", imageUrl: "fork.knife.circle.fill"),
        Category(name: "transport", imageUrl: "house.fill"),
        Category(name: "shopping", imageUrl: "handbag.fill"),
        Category(name: "home", imageUrl: "house.fill"),
        Category(name: "entertainment", imageUrl: "popcorn.fill")
    ]
}
