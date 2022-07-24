//
//  LayoutViewController.swift
//  GymBro
//
//  Created by sano on 7/22/22.
//

import SwiftUI
import CoreData

extension LayoutView {
    @MainActor class ViewController: ObservableObject {
        private var muscles: [Muscle] = []
        private var workouts: [Workout] = []
        private var moc = PersistenceController.shared.container.viewContext
        private let muscleFetch = Muscle.fetchRequest()
        private let workoutsFetch = Workout.fetchRequest()
        
        init() {
            self.fetchFromCD()
        }
        
        private func fetchFromCD() {
            do {
                self.muscles = try self.moc.fetch(self.muscleFetch)
                self.workouts = try self.moc.fetch(self.workoutsFetch)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        func prepareData() {
            if (!muscles.isEmpty) {
                self.fetchWorkouts()
                
                return
            }
            
            Service.getRequest("targetList", { data in
                do {
                    let parsedData = try JSONDecoder().decode([String].self, from: data)
                    
                    for muscle in parsedData {
                        PersistenceController.shared.createMuscle(self.moc, muscle)
                    }
                    
                    PersistenceController.shared.save(self.moc)
                    self.fetchFromCD()
                    self.fetchWorkouts()
                } catch {
                    print(error.localizedDescription)
                }
            })
        }
        
        private func fetchWorkouts() {
            if (!workouts.isEmpty) {
                return
            }
            
            Service.getRequest("", { data in
                do {
                    let parsedData = try JSONDecoder().decode([DecodableWorkout].self, from: data)
                    
                    for workout in parsedData {
                        PersistenceController.shared.createWorkout(
                            self.moc,
                            bodyPart: workout.bodyPart,
                            equipment: workout.equipment,
                            gifUrl: workout.gifUrl,
                            id: workout.id,
                            name: workout.name,
                            muscle: self.muscles.first(where: { $0.name == workout.target })!
                        )
                    }
                    
                    PersistenceController.shared.save(self.moc)
                } catch {
                    print(error.localizedDescription)
                }
            })
        }
    }
}
