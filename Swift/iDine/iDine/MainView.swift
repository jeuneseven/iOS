//
//  MainView.swift
//  iDine
//
//  Created by seven on 2025/8/20.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Menu", systemImage: "list.dash") {
                ContentView()
            }
            
            Tab("Order", systemImage: "square.and.pencil") {
                OrderView()
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(Order())
}
