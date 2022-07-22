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
    
    func save(_ ctx: NSManagedObjectContext) {
        if (ctx.hasChanges) {
            do {
                try ctx.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
