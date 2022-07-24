//
//  WorkoutListItemView.swift
//  GymBro
//
//  Created by sano on 7/21/22.
//

import SwiftUI

struct WorkoutListItemView: View {
    var body: some View {
        HStack {
            GifView("")
                .frame(width: 50, height: 50)
            
            VStack (alignment: .leading) {
                Text("3/4 sit up")
                    .font(.headline)
                    .padding(.bottom, 3)
                Text("Waist / ABS")
                    .font(.caption)
            }
            .padding(.leading, 5)
            
            Spacer()
            
            Image(systemName: "plus.circle")
                .font(.system(size: 24))
                .foregroundColor(Color.gray)
        }
        .padding(.vertical, 10)
    }
}

struct WorkoutListItemView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListItemView()
    }
}
