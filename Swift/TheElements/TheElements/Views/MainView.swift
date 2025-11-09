//
//  MainView.swift
//  TheElements
//
//  Created by seven on 2025/9/14.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Name", systemImage: "") {
                ContentView(sortType: .name)
            }
            
            Tab("Number", systemImage: "") {
                ContentView(sortType: .number)
            }
            
            Tab("Symbol", systemImage: "") {
                ContentView(sortType: .symbol)
            }
            
            Tab("State", systemImage: "") {
                ContentView(sortType: .state)
            }
        }
    }
}

#Preview {
    MainView()
}
