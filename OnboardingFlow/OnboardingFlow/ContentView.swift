//
//  ContentView.swift
//  OnboardingFlow
//
//  Created by seven on 2024/4/28.
//

import SwiftUI

let gradientColors: [Color] = [
    .pink,
    .red
]

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomePage()
            FeaturesPage()
        }

//        .background(Gradient.init(colors: gradientColors))
                .tabViewStyle(.page)
                .foregroundStyle(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
