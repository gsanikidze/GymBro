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
                    ForEach(vc.muscles) { muscle in
                        TagView(title: muscle.name!)
                    }
                }
                .padding(.horizontal, 15)
            }
            LazyVGrid(columns: cols, spacing: 15) {
                WorkoutCardView()
                WorkoutCardView()
                WorkoutCardView()
                WorkoutCardView()
                WorkoutCardView()
                WorkoutCardView()
                WorkoutCardView()
                WorkoutCardView()
                WorkoutCardView()
                WorkoutCardView()
            }
            .padding(15)
        }
    }
}

struct Workouts_Previews: PreviewProvider {
    static var previews: some View {
        Workouts()
    }
}
