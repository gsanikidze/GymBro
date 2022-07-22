//
//  Layout.swift
//  GymBro
//
//  Created by sano on 7/19/22.
//

import SwiftUI

struct LayoutView: View {
    @State private var isPlannedWorkoutsPresented = false
    
    var body: some View {
        NavigationView {
            TabView {
                Workouts()
                    .tabItem {
                        Label("Workouts", systemImage: "target")
                    }
                
                Favorites()
                    .tabItem {
                        Label("Favorites", systemImage: "heart")
                    }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("GymBro")
                        .font(.headline)
                }
                ToolbarItem {
                    Button(action: { isPlannedWorkoutsPresented.toggle() }) {
                        Image(systemName: "timer")
                    }
                }
            }
            .sheet(isPresented: $isPlannedWorkoutsPresented) {
                PlannedWorkouts()
            }
        }
    }
}

struct LayoutView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutView()
    }
}
