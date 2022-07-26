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
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack (spacing: 15) {
                    HStack {
                        Spacer()
                        GifView("http://d205bpvrqc9yn1.cloudfront.net/0001.gif")
                            .frame(width: bounds.width - 150, height: bounds.width - 150)
                            .cornerRadius(10)
                        Spacer()
                    }
                    
                    Text("Videos")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack (spacing: 15) {
                            GifView("https://i.ytimg.com/vi/MLfXovxCx6M/mqdefault.jpg")
                                .frame(width: 320, height: 180)
                                .cornerRadius(10)
                            GifView("https://i.ytimg.com/vi/MLfXovxCx6M/mqdefault.jpg")
                                .frame(width: 320, height: 180)
                                .cornerRadius(10)
                            GifView("https://i.ytimg.com/vi/MLfXovxCx6M/mqdefault.jpg")
                                .frame(width: 320, height: 180)
                                .cornerRadius(10)
                            GifView("https://i.ytimg.com/vi/MLfXovxCx6M/mqdefault.jpg")
                                .frame(width: 320, height: 180)
                                .cornerRadius(10)
                            GifView("https://i.ytimg.com/vi/MLfXovxCx6M/mqdefault.jpg")
                                .frame(width: 320, height: 180)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.leading)
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back", action: { dismiss() })
                }
                
                ToolbarItem (placement: .principal) {
                    VStack {
                        Text("Workout title")
                            .font(.headline)
                        Text("Workout desc")
                            .font(.caption)
                    }
                }
                
                ToolbarItem {
                    Image(systemName: "heart")
                }
                ToolbarItem {
                    Image(systemName: "plus.circle")
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details()
    }
}
