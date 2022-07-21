//
//  TagView.swift
//  GymBro
//
//  Created by sano on 7/21/22.
//

import SwiftUI

struct TagView: View {
    var body: some View {
        Text("Some")
            .foregroundColor(Color.white)
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.indigo))
            .offset(x: 0, y: 0)
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView()
            .previewLayout(.sizeThatFits)
    }
}
