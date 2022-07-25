//
//  Favorites.swift
//  GymBro
//
//  Created by sano on 7/21/22.
//

import SwiftUI

struct Favorites: View {
    private let data = Array(repeating: UUID(), count: 3)
    @ObservedObject private var vc = ViewController()
    
    var body: some View {
        List {
            ForEach(vc.workouts) { workout in
                WorkoutListItemView(workout: workout)
            }
            .onDelete(perform: {indexSet in vc.deleteFav(indexSet) })
        }
        .listStyle(.plain)
        .onAppear {
            vc.fetchFavWorkouts()
        }
    }
}
