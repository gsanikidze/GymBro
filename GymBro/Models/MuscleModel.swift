//
//  MuscleModel.swift
//  GymBro
//
//  Created by sano on 7/22/22.
//

import Foundation
import CoreData

extension Muscle {
    func create(_ ctx: NSManagedObjectContext, _ name: String) {
        let muscle = Muscle()
        muscle.uid = UUID()
        muscle.name = name
        
        PersistenceController.shared.save(ctx)
    }
}
