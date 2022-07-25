//
//  MuscleModel.swift
//  GymBro
//
//  Created by sano on 7/22/22.
//

import Foundation
import CoreData

extension PersistenceController {
    func createMuscle(_ name: String) -> Void {
        let muscle = Muscle(context: self.context)
        muscle.uid = UUID()
        muscle.name = name
    }
}
