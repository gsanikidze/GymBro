//
//  WorkoutModel.swift
//  GymBro
//
//  Created by sano on 7/22/22.
//

import Foundation
import CoreData

extension PersistenceController {
    func createWorkout(bodyPart: String, equipment: String, gifUrl: String, id: String, name: String, muscle: Muscle) {
        let workout = Workout(context: self.context)
        workout.uid = UUID()
        workout.bodyPart = bodyPart
        workout.equipment = equipment
        workout.gifUrl = gifUrl
        workout.id = id
        workout.name = name
        workout.muscle = muscle
        workout.target = muscle.name
    }
    
    func toggleFavWorkout(_ workout: Workout) {
        workout.isFavorite.toggle()
        self.save()
    }
    
    func toggleIsInSession(_ workout: Workout) {
        workout.isInSession.toggle()
        self.save()
    }
}

struct DecodableWorkout: Codable {
    var bodyPart: String
    var equipment: String
    var gifUrl: String
    var id: String
    var name: String
    var target: String
}
