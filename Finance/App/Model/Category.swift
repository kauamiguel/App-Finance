//
//  Categorie.swift
//  Finance
//
//  Created by Kaua Miguel on 26/06/25.
//

import SwiftUI

struct Category{
    var id = UUID()
    var name : String
    var imageName : String
    
    static let defaultCategories : [Category] = [
        Category(name: "Alimentação", imageName: "fork.knife.circle.fill"),
        Category(name: "Transporte", imageName: "house.fill"),
        Category(name: "Shopping", imageName: "handbag.fill"),
        Category(name: "Casa", imageName: "house.fill"),
        Category(name: "Entreterimento", imageName: "popcorn.fill")
    ]
}
