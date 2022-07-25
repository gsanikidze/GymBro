//
//  WorkoutListItemView.swift
//  GymBro
//
//  Created by sano on 7/21/22.
//

import SwiftUI

struct WorkoutListItemView: View {
    let workout: Workout
    
    @State private var isInSession: Bool = false
    
    func toggleIsInSession() {
        withAnimation {
            isInSession.toggle()
            PersistenceController.shared.toggleIsInSession(workout)
        }
    }
    
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
            
            Image(systemName: isInSession ? "minus.circle.fill" : "plus.circle")
                .font(.system(size: 24))
                .foregroundColor(isInSession ? Color.indigo : Color.gray)
                .onTapGesture {
                    toggleIsInSession()
                }
        }
        .padding(.vertical, 10)
        .onAppear {
            isInSession = workout.isInSession
        }
    }
}
