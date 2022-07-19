//
//  GymBroApp.swift
//  GymBro
//
//  Created by sano on 7/19/22.
//

import SwiftUI

@main
struct GymBroApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
