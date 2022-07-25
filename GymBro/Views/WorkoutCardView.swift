//
//  WorkoutCardView.swift
//  GymBro
//
//  Created by sano on 7/19/22.
//

import SwiftUI

struct WorkoutCardView: View {
    let workout: Workout
    
    @State private var isFav: Bool
    @State private var isInSession: Bool
    
    init(workout: Workout) {
        self.workout = workout
        _isFav = State(initialValue: workout.isFavorite)
        _isInSession = State(initialValue: workout.isInSession)
    }
    
    func toggleIsFav() {
        withAnimation {
            isFav.toggle()
            PersistenceController.shared.toggleFavWorkout(workout)
        }
    }
    
    func toggleIsInSession() {
        withAnimation {
            isInSession.toggle()
            PersistenceController.shared.toggleIsInSession(workout)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: isInSession ? "minus.circle.fill" : "plus.circle")
                    .font(.system(size: 24))
                    .foregroundColor(isInSession ? Color.indigo : Color.gray)
                    .onTapGesture {
                        toggleIsInSession()
                    }
                Spacer()
                Image(systemName: "heart\(isFav ? ".fill" : "")")
                    .font(.system(size: 24))
                    .foregroundColor(isFav ? Color.pink : Color.gray)
                    .onTapGesture {
                        toggleIsFav()
                    }
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
