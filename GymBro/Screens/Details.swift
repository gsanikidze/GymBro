//
//  Details.swift
//  GymBro
//
//  Created by sano on 7/26/22.
//

import SwiftUI

struct Details: View {
    @Environment(\.dismiss) private var dismiss
    private let bounds = UIScreen.main.bounds
    let workout: Workout
    
    @State private var isFav = false
    @State private var isInSession = false
    
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
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack (spacing: 15) {
                    HStack {
                        Spacer()
                        WebView(workout.gifUrl!)
                            .frame(width: bounds.width - 150, height: bounds.width - 150)
                            .cornerRadius(10)
                        Spacer()
                    }
                    
                    Text("Videos")
                        .font(.title2)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack (spacing: 15) {
                            YoutubeVideoCardView()
                                .padding(.leading)
                            YoutubeVideoCardView()
                            YoutubeVideoCardView()
                            YoutubeVideoCardView()
                            YoutubeVideoCardView()
                                .padding(.trailing)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back", action: { dismiss() })
                }
                
                ToolbarItem (placement: .principal) {
                    VStack(spacing: 3) {
                        Text(workout.name!.capitalized)
                            .font(.headline)
                        Text("\(workout.bodyPart!.capitalized) | \(workout.target!.uppercased())")
                            .font(.caption)
                    }
                }
                
                
                ToolbarItem {
                    Image(systemName: isInSession ? "minus.circle.fill" : "plus.circle")
                        .font(.system(size: 15))
                        .foregroundColor(isInSession ? Color.indigo : Color.gray)
                        .onTapGesture {
                            toggleIsInSession()
                        }
                }
                ToolbarItem {
                    Image(systemName: "heart\(isFav ? ".fill" : "")")
                        .font(.system(size: 15))
                        .foregroundColor(isFav ? Color.pink : Color.gray)
                        .onTapGesture {
                            toggleIsFav()
                        }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            isFav = workout.isFavorite
            isInSession = workout.isInSession
        }
    }
}
