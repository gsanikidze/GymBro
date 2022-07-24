//
//  TagView.swift
//  GymBro
//
//  Created by sano on 7/21/22.
//

import SwiftUI

struct TagView: View {
    let title: String
    var outlined: Bool = false
    
    var body: some View {
        Text(title.capitalized)
            .foregroundColor(outlined ? Color.indigo : Color.white)
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 10)
                .foregroundColor(outlined ? Color.white.opacity(0) : Color.indigo))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.indigo, lineWidth: 2)
            }
            .padding(3)
            .offset(x: 0, y: 0)
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(title: "some tag")
            .previewLayout(.sizeThatFits)
        
        TagView(title: "some tag", outlined: true)
            .previewLayout(.sizeThatFits)
    }
}
