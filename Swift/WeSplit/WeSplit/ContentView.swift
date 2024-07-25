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
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20

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
            
            Form {
                ForEach(0..<10) {
                    Text("Row \($0)")
                }
            }
        }
        
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
