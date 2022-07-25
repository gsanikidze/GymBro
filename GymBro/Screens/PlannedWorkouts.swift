//
//  PlannedWorkouts.swift
//  GymBro
//
//  Created by sano on 7/22/22.
//

import SwiftUI

struct PlannedWorkouts: View {
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject private var vc = ViewController()
    
    var body: some View {
        NavigationView {
            List {
                if vc.workouts.isEmpty {
                    HStack {
                        Spacer()
                        Text("Session is empty")
                            .font(.caption)
                        Spacer()
                    }
                } else {
                    ForEach(vc.workouts) { workout in
                        WorkoutListItemView(workout: workout)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Planned Workouts")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button ("Close", action: { dismiss() })
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    if !vc.workouts.isEmpty {
                        Button("Reset", action: {
                            vc.resetSession()
                            dismiss()
                        })
                        .tint(.pink)
                    }
                }
            }
        }
        .onAppear {
            vc.fetchWorkouts()
        }
    }
}
