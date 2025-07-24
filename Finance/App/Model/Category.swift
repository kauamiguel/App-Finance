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
        Category(name: "alimentação", imageUrl: "fork.knife.circle.fill"),
        Category(name: "transporte", imageUrl: "house.fill"),
        Category(name: "shopping", imageUrl: "handbag.fill"),
        Category(name: "casa", imageUrl: "house.fill"),
        Category(name: "entreterimento", imageUrl: "popcorn.fill")
    ]
}
