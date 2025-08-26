//
//  MainView.swift
//  AccessibilitySandbox
//
//  Created by seven on 2025/8/23.
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
