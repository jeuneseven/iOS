//
//  ContentView.swift
//  WeSplit
//
//  Created by seven on 2024/7/18.
//

import SwiftUI
//conform View protocol, must return some view
struct ContentView: View {
    @State private var tapCount = 0
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello World!")
                }
            }
            .navigationTitle("Title")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        Button("tapCount : \(tapCount)") {
            self.tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
