//
//  Favorites.swift
//  GymBro
//
//  Created by sano on 7/21/22.
//

import SwiftUI

struct Favorites: View {
    private let data = Array(repeating: UUID(), count: 3)
    
    var body: some View {
        List {
            ForEach(data, id: \.self) { uid in
                WorkoutListItemView()
            }
            .onDelete(perform: {_ in print("Unfavorite") })
        }
        .listStyle(.plain)
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
