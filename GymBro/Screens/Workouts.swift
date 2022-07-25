//
//  ByMuscleScreen.swift
//  GymBro
//
//  Created by sano on 7/19/22.
//

import SwiftUI

struct Workouts: View {
    @StateObject private var vc = ViewController()
    
    private let cols = Array(repeating: GridItem(spacing: 15), count: 2)
    
    var body: some View {
        ScrollView([.vertical], showsIndicators: false) {
            ScrollView([.horizontal], showsIndicators: false) {
                HStack {
                    TagView(title: "All", outlined: vc.selectedMuscle != nil)
                        .onTapGesture {
                            vc.selectMuscle(nil)
                        }
                    ForEach(vc.muscles) { muscle in
                        TagView(title: muscle.name!, outlined: muscle != vc.selectedMuscle)
                            .onTapGesture {
                                vc.selectMuscle(muscle)
                            }
                    }
                }
                .padding(.horizontal, 15)
            }
            LazyVGrid(columns: cols, spacing: 15) {
                ForEach(vc.workouts) { workout in
                    WorkoutCardView(workout: workout)
                }
            }
            .padding(15)
        }
        .onAppear {
            vc.fetchWorkouts()
        }
    }
}
