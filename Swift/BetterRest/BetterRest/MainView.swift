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
            
            Tab("Basic", systemImage: "list.dash") {
                BasicView()
            }
        }
    }
}

#Preview {
    MainView()
}
