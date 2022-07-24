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
        
        func fetchMuscles() {
            if (!muscles.isEmpty) {
                return
            }
            
            Service.getRequest("targetList", { data in
                do {
                    let parsedData = try JSONDecoder().decode([String].self, from: data)
                    
                    for muscle in parsedData {
                        PersistenceController.shared.createMuscle(self.moc, muscle)
                        PersistenceController.shared.save(self.moc)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            })
        }
    }
}
