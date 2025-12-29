//
//  ContentView.swift
//  ParaphraseSwiftUI
//
//  Created by seven on 2025/12/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { number in
                    Text("\(number)")
                        .font(.title)
                        .foregroundStyle(.primary)
                }
            }
            .navigationTitle("Paraphrase")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("", systemImage: "plus") {
                        
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Random") {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
