//
//  Persistence.swift
//  GymBro
//
//  Created by sano on 7/19/22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        get {
            return self.container.viewContext
        }
    }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "GymBro")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func save() {
        if (context.hasChanges) {
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
