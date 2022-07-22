//
//  WorkoutModel.swift
//  GymBro
//
//  Created by sano on 7/22/22.
//

import Foundation
import CoreData

extension Workout {
    func create(_ ctx: NSManagedObjectContext, bodyPart: String, equipment: String, gifUrl: String, id: String, name: String, muscle: Muscle) {
        let workout = Workout()
        workout.uid = UUID()
        workout.bodyPart = bodyPart
        workout.equipment = equipment
        workout.gifUrl = gifUrl
        workout.id = id
        workout.name = name
        workout.muscle = muscle
        workout.target = muscle.name
        
        PersistenceController.shared.save(ctx)
    }
}
