//
//  ContentView.swift
//  WeSplit
//
//  Created by seven on 2024/7/18.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    @State private var name = ""

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter your name", text: $name)
                    Text("Hello World!")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
