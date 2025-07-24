//
//  CategoryRepository.swift
//  Finance
//
//  Created by Kaua Miguel on 23/07/25.
//

import Foundation
import CoreData

final class CategoryRepository{
    private let context : NSManagedObjectContext
    
    init() {
        context = CoreDataStack.shared.viewContext
        initializeDefaultCategoriesIfNeeded()
    }
    
    public func createCategory(newCategory:Category) {
        let categoryEntity = CategoryEntity(context: context)
        categoryEntity.name = newCategory.name
        categoryEntity.imageUrl = newCategory.imageUrl
        saveContext()
    }
    
    public func addExpense(to categoryName:String, expense:ExpenseEntity){
        let category = fetchCategory(by: categoryName)
        category?.addToExpenses(expense)
        saveContext()
        
        
    }
    
    private func initializeDefaultCategoriesIfNeeded() {
        let alreadyInitialized = UserDefaults.standard.bool(forKey: "didInitializedDefaultCategories")
        if alreadyInitialized {
            return
        }
        
        let existingCategories = try? fetchAllCategories()
        if existingCategories?.isEmpty == false{
            UserDefaults.standard.set(true, forKey: "didInitializedDefaultCategories")
            return
        }
        
        for defaultCategory in Category.defaultCategories {
            createCategory(newCategory: defaultCategory)
        }
        
        UserDefaults.standard.set(true, forKey: "didInitializedDefaultCategories")
        print("Categorias padrão criada")
    }
    
    public func fetchAllCategories() throws -> [Category] {
        var categories : [Category] = []
        let request : NSFetchRequest<CategoryEntity> = CategoryEntity.fetchRequest()
        
        do{
            let categoriesRequestResult = try context.fetch(request)
            categories =  categoriesRequestResult.map { categorieEntity in
                Category(name: categorieEntity.name ?? "", imageUrl: categorieEntity.imageUrl ?? "")
            }
        }catch (let error){
            print("fetchCategories Error: \(error.localizedDescription)")
        }
        return categories
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
