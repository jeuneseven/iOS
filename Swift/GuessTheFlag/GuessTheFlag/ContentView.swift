//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by seven on 2024/9/3.
//

import SwiftUI

struct ContentView: View {
    
        @State private var showingAlert = false
    var body: some View {

            Button("Show Alert") {
                showingAlert = true
            }
            .alert("Important message", isPresented: $showingAlert) {
                Button("OK") { }
            }
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
        
        Text("Your content")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.red.gradient)
        
        Button {
            print("Edit button was tapped")
        } label: {
            Label("Edit", systemImage: "pencil")
                .padding()
                .foregroundStyle(.white)
                .background(.red)
        }
    }
}

#Preview {
    ContentView()
}
