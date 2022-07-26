//
//  Layout.swift
//  GymBro
//
//  Created by sano on 7/19/22.
//

import SwiftUI

struct LayoutView: View {
    @StateObject private var vc = ViewController()
    @State private var isPlannedWorkoutsPresented = false
    
    var body: some View {
        NavigationView {
            TabView {
                if !isPlannedWorkoutsPresented && vc.workouts.count > 0 {
                    Workouts()
                        .tabItem {
                            Label("Workouts", systemImage: "target")
                        }
                    
                    Favorites()
                        .tabItem {
                            Label("Favorites", systemImage: "heart")
                        }
                } else {
                    Spacer()
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
        }.onAppear {
            vc.prepareData()
        }
        .navigationBarBackButtonHidden(true)
    }
}
