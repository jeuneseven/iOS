//
//  CircleImage.swift
//  Landmarks
//
//  Created by seven on 2025/9/6.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
//            .resizable()
//            .scaledToFit()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image(.turtlerock))
}
