//
//  WorkoutListItemView.swift
//  GymBro
//
//  Created by sano on 7/21/22.
//

import SwiftUI

struct WorkoutListItemView: View {
    let workout: Workout
    
    var body: some View {
        HStack {
            GifView(workout.gifUrl!)
                .frame(width: 50, height: 50)
            
            VStack (alignment: .leading) {
                Text(workout.name!.capitalized)
                    .font(.headline)
                    .padding(.bottom, 3)
                Text("\(workout.bodyPart!.capitalized) / \(workout.target!.uppercased())")
                    .font(.caption)
            }
            .padding(.leading, 5)
            
            Spacer()
            
            Image(systemName: "plus.circle")
                .font(.system(size: 24))
                .foregroundColor(Color.gray)
        }
        .padding(.vertical, 10)
    }
}
