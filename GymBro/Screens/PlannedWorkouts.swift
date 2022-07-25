//
//  PlannedWorkouts.swift
//  GymBro
//
//  Created by sano on 7/22/22.
//

import SwiftUI

struct PlannedWorkouts: View {
    @Environment(\.dismiss) private var dismiss
    
    private let data = Array(repeating: UUID(), count: 3)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data, id: \.self) { uid in
//                    WorkoutListItemView()
                    Text("sss")
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
                    Button("Reset", action: {})
                        .tint(.pink)
                }
            }
        }
    }
}

struct PlannedWorkouts_Previews: PreviewProvider {
    static var previews: some View {
        PlannedWorkouts()
    }
}
