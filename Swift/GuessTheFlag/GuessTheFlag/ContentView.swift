//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by seven on 2024/9/3.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack(spacing: 20) {
//            Text("Hello, world!")
//            Text("This is inside a stack")
//        }
//        
//        VStack(alignment: .leading) {
//            Text("Hello, world!")
//            Text("This is inside a stack")
//        }
//        
//        HStack(spacing: 20) {
//            Text("Hello, world!")
//            Text("This is inside a stack")
//        }
//        
//        ZStack(alignment: .top) {
//            Text("Hello, world!")
//            Text("This is inside a stack")
//        }
//        
//        VStack {
//            Text("First")
//            Text("Second")
//            Text("Third")
//            Spacer()
//            Spacer()
//        }
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }

            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
