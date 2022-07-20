//
//  Layout.swift
//  GymBro
//
//  Created by sano on 7/19/22.
//

import SwiftUI

struct LayoutView: View {
    var body: some View {
        TabView {
            ByMuscleScreen()
                .tabItem {
                    Label("Workouts", systemImage: "target")
                }
            
            Text("Favorites")
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}

struct LayoutView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutView()
    }
}
