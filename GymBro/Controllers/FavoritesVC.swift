//
//  FavoritesVC.swift
//  GymBro
//
//  Created by sano on 7/25/22.
//

import CoreData
import SwiftUI

struct WorkoutByMuscle: Identifiable {
    var id: UUID
    var muscle: Muscle
    var workouts: [Workout]
}

extension Favorites {
    class ViewController: ObservableObject {
        @Published var workoutsByMuscle: [WorkoutByMuscle] = []
        
        func fetchFavWorkouts() {
            let fetchRequest = NSFetchRequest<Workout>(entityName: "Workout")
            fetchRequest.predicate = NSPredicate(format: "isFavorite = true")
            
            workoutsByMuscle = []
            
            do {
                let workouts = try PersistenceController.shared.context.fetch(fetchRequest)
                
                for workout in workouts {
                    let groupIndex = workoutsByMuscle.firstIndex(where: { $0.id == workout.muscle?.uid }) ?? -1
                    
                    if groupIndex >= 0 {
                        workoutsByMuscle[groupIndex].workouts.append(workout)
                    } else {
                        let newGroup = WorkoutByMuscle(id: workout.muscle!.uid!, muscle: workout.muscle!, workouts: [workout])
                        
                        workoutsByMuscle.append(newGroup)
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        
        func deleteFav(_ indexSet: IndexSet, _ muscleId: UUID) {
            for i in indexSet {
                let workoutGroupIndex = workoutsByMuscle.firstIndex(where: { $0.id == muscleId })!

                PersistenceController.shared.toggleFavWorkout(workoutsByMuscle[workoutGroupIndex].workouts[i])
                workoutsByMuscle[workoutGroupIndex].workouts.remove(at: i)
                
                if (workoutsByMuscle[workoutGroupIndex].workouts.count == 0) {
                    workoutsByMuscle.remove(at: workoutGroupIndex)
                }
            }
        }
    }
}
