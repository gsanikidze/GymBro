//
//  ByMuscleScreen.swift
//  GymBro
//
//  Created by sano on 7/19/22.
//

import SwiftUI

struct ByMuscleScreen: View {
    private let cols = Array(repeating: GridItem(spacing: 15), count: 2)
    private let data = Array(repeating: WorkoutCardView(), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: cols, spacing: 15) {
                WorkoutCardView()
                WorkoutCardView()
                WorkoutCardView()
            }
            .padding(15)
        }
    }
}

struct ByMuscleScreen_Previews: PreviewProvider {
    static var previews: some View {
        ByMuscleScreen()
    }
}
