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
            
            Spacer()
            
            GifView(workout.gifUrl!)
                .frame(width: 100, height: 100)
                .clipped()
            
            Spacer()
            
            Text(workout.name!.capitalized)
                .font(.subheadline)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(.bottom, 2)
            Text("\(workout.bodyPart!.capitalized) / \(workout.target!.uppercased())")
                .font(.caption)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
        }
        .padding(10)
        .frame(minHeight: 250)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}
