//
//  FavoritesVC.swift
//  GymBro
//
//  Created by sano on 7/25/22.
//

import CoreData
import SwiftUI

extension Favorites {
    class ViewController: ObservableObject {
        @Published var workouts: [Workout] = []
        
        func fetchFavWorkouts() {
            let fetchRequest = NSFetchRequest<Workout>(entityName: "Workout")
            fetchRequest.predicate = NSPredicate(format: "isFavorite = true")
            
            do {
                workouts = try PersistenceController.shared.context.fetch(fetchRequest)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        func deleteFav(_ indexSet: IndexSet) {
            for i in indexSet {
                PersistenceController.shared.toggleFavWorkout(workouts[i])
                workouts.remove(at: i)
            }
        }
    }
}
