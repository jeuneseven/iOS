//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by seven on 2024/10/13.
//

import SwiftUI

@ViewBuilder var spells: some View {
    Text("Lumos")
    Text("Obliviate")
}

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        
        let motto1 = Text("Draco dormiens")
        let motto2 = Text("nunquam titillandus")

        VStack {
            motto1
            motto2
        }
        
        if useRedText {
            Button("Hello World") {
                useRedText.toggle()
            }
            .foregroundStyle(.red)
        } else {
            Button("Hello World") {
                useRedText.toggle()
            }
            .foregroundStyle(.blue)
        }
    }
}

#Preview {
    ContentView()
}
