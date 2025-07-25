//
//  ExpensesViewModel.swift
//  Finance
//
//  Created by Kaua Miguel on 26/06/25.
//

import SwiftUI

class ExpensesViewModel : ObservableObject{
    @Published var expenseAmount:String = ""
    @Published var expenseNote:String = ""
    @Published var expenseCategoryType:String = ""
    private var expenseRepository:ExpenseRepository = ExpenseRepository()
    private var categoryRepository:CategoryRepository = CategoryRepository()
    
    init() {}
    
    public func fetchAllCategories() -> [Category] {
        do {
            return try categoryRepository.fetchAllCategories()
        }catch(let error){
            print("Unable to fetch all categories: \(error.localizedDescription)")
            return []
        }
    }
    
    public func addExpenseToCategory() {
        let expenseModel = Expense(note: self.expenseNote, amount: formatAndReturnExpenseAmount())
        let expenseEntity = expenseRepository.createExpenseEntity(expense: expenseModel)
        categoryRepository.addExpense(to: self.expenseCategoryType, expense: expenseEntity)
        clearViewData()
    }
    
    private func formatAndReturnExpenseAmount() -> Double {
        return Double(self.expenseAmount.replacingOccurrences(of: ",", with: ".")) ?? 0.0
    }
    
    public func clearViewData(){
        self.expenseAmount = ""
        self.expenseCategoryType = ""
        self.expenseNote = ""
    }
    
}
