//
//  CategoryViewModel.swift
//  Finance
//
//  Created by Kaua Miguel on 25/07/25.
//

import SwiftUI

class CategoryViewModel : ObservableObject{
    private var expenseRepository:ExpenseRepository = ExpenseRepository()
    private var categoryRepository:CategoryRepository = CategoryRepository()
    
    public func fetchAllCategories() -> [Category] {
        do {
            return try categoryRepository.fetchAllCategories()
        }catch(let error){
            print("Unable to fetch all categories: \(error.localizedDescription)")
            return []
        }
    }
    
    public func fetchExpensePerCategory(categoryName:String) -> Double {
        return categoryRepository.fetchTotalExpensePerCategory(categoryName: categoryName)
    }
}
