//
//  ContentView.swift
//  Animations
//
//  Created by seven on 2025/3/10.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(
            .easeInOut(duration: 1)
                .repeatForever(autoreverses: true),
            value: animationAmount
        )
//        .animation(
//            .easeInOut(duration: 1)
//                .repeatCount(3, autoreverses: true),
//            value: animationAmount
//        )
//        .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
//        .animation(
//            .easeInOut(duration: 2)
//                .delay(1),
//            value: animationAmount
//        )
    }
}

#Preview {
    ContentView()
}
