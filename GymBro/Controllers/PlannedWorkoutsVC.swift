//
//  PlannedWorkoutsVC.swift
//  GymBro
//
//  Created by sano on 7/25/22.
//

import CoreData
import SwiftUI

extension PlannedWorkouts {
    class ViewController: ObservableObject {
        @Published var workouts: [Workout] = []
        
        func fetchWorkouts() {
            let fetchRequest = NSFetchRequest<Workout>(entityName: "Workout")
            fetchRequest.predicate = NSPredicate(format: "isInSession = true")
            
            do {
                workouts = try PersistenceController.shared.context.fetch(fetchRequest)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        func resetSession() {
            for workout in workouts {
                workout.isInSession = false
                PersistenceController.shared.save()
            }
        }
    }
}
