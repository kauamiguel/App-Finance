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
    
    public func createCategory(newCategory:CategoryExpense) {
        let categoryEntity = CategoryEntity(context: context)
        categoryEntity.expense = newCategory.expense
        categoryEntity.name = newCategory.name
        categoryEntity.imageName = newCategory.imageName
        categoryEntity.note = newCategory.note
        saveContext()    
    }
    
    public func fetchCategories() throws -> [CategoryExpense] {
        var categories : [CategoryExpense] = []
        let request : NSFetchRequest<CategoryEntity> = CategoryEntity.fetchRequest()
        
        do{
            let categoriesRequestResult = try context.fetch(request)
            categories =  categoriesRequestResult.map { categorieEntity in
                CategoryExpense(name: categorieEntity.name ?? "",
                         imageName: categorieEntity.imageName ?? "",
                                note: categorieEntity.note ?? "",
                         expense: categorieEntity.expense)
            }
        }catch (let error){
            print("fetchCategories Error: \(error.localizedDescription)")
        }
        return categories
    }
    
    public func addExpense(to categoryName : String, amount : Double) {
        guard let entity = fetchCategory(by: categoryName) else { return }
        entity.expense += amount
        saveContext()
        
    }
    
    private func fetchCategory(by name:String) -> CategoryEntity?{
        let request : NSFetchRequest<CategoryEntity> = CategoryEntity.fetchRequest()
        request.predicate = NSPredicate(format: "name ==[c] %@", name)
        request.fetchLimit = 1
        
        do{
            
            return try context.fetch(request).first
        }catch{
            print("Category not found")
            return nil
        }
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
