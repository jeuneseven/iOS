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
