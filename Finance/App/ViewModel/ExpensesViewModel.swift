//
//  ExpensesViewModel.swift
//  Finance
//
//  Created by Kaua Miguel on 26/06/25.
//

import SwiftUI

class ExpensesViewModel : ObservableObject{
    @Published var expenseAmount : String = ""
    @Published var note : String = ""
    @Published var name : String = ""
    private var expenseRepository : ExpenseRepository = ExpenseRepository()
    
    init() {}
    
    public func getAllExpenseCategories() -> [CategoryExpense] {
        return getDefaultCategories() + getCustomCategories()
    }
    
    private func getDefaultCategories() -> [CategoryExpense] {
        return CategoryExpense.defaultCategories
    }
    
    private func getCustomCategories() -> [CategoryExpense] {
        do {
            return try expenseRepository.fetchCategories()
        }catch{
            return []
        }
    }
    
    public func addCategoryExpense() {
        expenseRepository.addExpense(to: self.name, amount: formatAndReturnExpenseAmount())
        clearViewData()
    }
    
    private func formatAndReturnExpenseAmount() -> Double {
        return Double(self.expenseAmount.replacingOccurrences(of: ",", with: ".")) ?? 0.0
    }
    
    private func clearViewData(){
        self.expenseAmount = ""
        self.name = ""
        self.note = ""
    }
    
}
