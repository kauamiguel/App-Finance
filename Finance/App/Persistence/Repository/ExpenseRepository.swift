//
//  Untitled.swift
//  Finance
//
//  Created by Kaua Miguel on 22/07/25.
//

import CoreData

final class ExpenseRepository{
    private let context : NSManagedObjectContext
    
    init(){
        self.context = CoreDataStack.shared.viewContext
    }
    
    public func createExpenseEntity(expense : Expense) -> ExpenseEntity {
        let expenseEntity = ExpenseEntity(context: self.context)
        expenseEntity.amount = expense.amount
        expenseEntity.note = expense.note
        return expenseEntity
    }
    
    private func saveContext() {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            print("Failed to save the context:", error.localizedDescription)
        }
    }
}
