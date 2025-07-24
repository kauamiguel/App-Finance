//
//  ContainerCoreData.swift
//  Finance
//
//  Created by Kaua Miguel on 21/07/25.
//

import CoreData

final class CoreDataStack{
    private var container : NSPersistentContainer!
    static let shared : CoreDataStack = CoreDataStack()
    var viewContext : NSManagedObjectContext {
        return container.viewContext
    }

    init() {
        initializeContainer()
    }
    
    private func initializeContainer() {
        container = NSPersistentContainer(name: "ExpensesModel")
        container.loadPersistentStores { description, error in
            if let error = error{
                fatalError("Error : \(error.localizedDescription)")
            }else{
                print("Container initialized")
            }
        }
    }
}
