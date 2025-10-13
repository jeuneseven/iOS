//
//  MainView.swift
//  GuessTheFlag
//
//  Created by seven on 2025/8/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Content", systemImage: "globe") {
                ContentView()
            }
            
            Tab("Practise", systemImage: "pencil.tip.crop.circle") {
                PractiseView()
            }
        }
    }
}

#Preview {
    MainView()
}
