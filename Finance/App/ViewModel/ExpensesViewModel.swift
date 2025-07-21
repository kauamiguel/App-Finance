//
//  ExpensesViewModel.swift
//  Finance
//
//  Created by Kaua Miguel on 26/06/25.
//

import SwiftUI

class ExpensesViewModel : ObservableObject{
    @Published var categories : [Category?] = []
    
    init(){}
    
    public func getCategoriesImageName() -> [String?]{
        var categoriesImageNames : [String?] = []
        
        for category in categories{
            categoriesImageNames.append(category?.imageName)
        }
        
        return categoriesImageNames
    }
    
    public func getDefaultCategories() -> [Category]{
        return Category.defaultCategories
    }
}
