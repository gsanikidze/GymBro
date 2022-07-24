//
//  WorkoutCardView.swift
//  GymBro
//
//  Created by sano on 7/19/22.
//

import SwiftUI

struct WorkoutCardView: View {
    let workout: Workout
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "plus.circle")
                    .font(.system(size: 24))
                    .foregroundColor(Color.gray)
                Spacer()
                Image(systemName: "heart")
                    .font(.system(size: 24))
                    .foregroundColor(Color.gray)
            }
            .padding(.bottom, 10)
            
            GifView(workout.gifUrl!)
                .frame(width: 100, height: 100)
                .clipped()
            Text(workout.name!)
                .font(.headline)
                .foregroundColor(Color.black)
                .padding(.bottom, 5)
            Text("\(workout.bodyPart!) / \(workout.target!)")
                .font(.caption)
                .foregroundColor(Color.gray)
        }
        .padding(15)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}
