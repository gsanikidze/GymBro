//
//  Layout.swift
//  GymBro
//
//  Created by sano on 7/19/22.
//

import SwiftUI

struct LayoutView: View {
    var body: some View {
        NavigationView {
            TabView {
                Workouts()
                    .tabItem {
                        Label("Workouts", systemImage: "target")
                    }
                
                Text("Favorites")
                    .tabItem {
                        Label("Favorites", systemImage: "heart")
                    }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("GymBro")
                        .font(.headline)
                }
                ToolbarItem {
                    Button(action: {}) {
                        Image(systemName: "timer")
                    }
                }
            }
        }
    }
}

struct LayoutView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutView()
    }
}
