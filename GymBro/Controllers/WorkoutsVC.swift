//
//  WorkoutsViewController.swift
//  GymBro
//
//  Created by sano on 7/22/22.
//

import SwiftUI
import CoreData

extension Workouts {
    @MainActor class ViewController: ObservableObject {
        @Published var muscles: [Muscle] = []
        @Published var workouts: [Workout] = []
        @Published var selectedMuscle: Muscle? = nil
        
        private var moc = PersistenceController.shared.context
        private let muscleFetch = Muscle.fetchRequest()
        private let workoutsFetch = Workout.fetchRequest()
        
        init() {
            do {
                self.muscles = try self.moc.fetch(self.muscleFetch)
                self.workouts = try self.moc.fetch(self.workoutsFetch)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        func selectMuscle(_ muscle: Muscle?) {
            self.selectedMuscle = muscle
            self.getWorkoutsByMuscle()
        }
        
        private func getWorkoutsByMuscle() {
            var request = self.workoutsFetch
            
            if (selectedMuscle != nil) {
                request = NSFetchRequest<Workout>(entityName: "Workout")
                request.predicate = NSPredicate(format: "target = %@", self.selectedMuscle!.name!)
            }
            
            do {
                self.workouts = try self.moc.fetch(request)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
