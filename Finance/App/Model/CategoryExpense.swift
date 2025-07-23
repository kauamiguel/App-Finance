//
//  Categorie.swift
//  Finance
//
//  Created by Kaua Miguel on 26/06/25.
//

import SwiftUI

struct CategoryExpense{
    var id = UUID()
    var name : String
    var imageName : String
    var note : String = ""
    var expense : Double = 0
    
    static let defaultCategories : [CategoryExpense] = [
        CategoryExpense(name: "alimentação", imageName: "fork.knife.circle.fill"),
        CategoryExpense(name: "transporte", imageName: "house.fill"),
        CategoryExpense(name: "shopping", imageName: "handbag.fill"),
        CategoryExpense(name: "casa", imageName: "house.fill"),
        CategoryExpense(name: "entreterimento", imageName: "popcorn.fill")
    ]
}
