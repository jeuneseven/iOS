//
//  MainView.swift
//  SwiftDataDemo
//
//  Created by seven on 2025/8/31.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Content", systemImage: "globe") {
                ContentView()
            }
        }
    }
}

#Preview {
    MainView()
}
