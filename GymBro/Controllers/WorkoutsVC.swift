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
        private var moc = PersistenceController.shared.container.viewContext
        private let muscleFetch = Muscle.fetchRequest()
        
        init() {
            do {
                self.muscles = try self.moc.fetch(self.muscleFetch)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
