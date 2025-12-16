//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by seven on 2025/9/7.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker")
                .font(.largeTitle)
            
            Text("Please select a resort from left side.")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
