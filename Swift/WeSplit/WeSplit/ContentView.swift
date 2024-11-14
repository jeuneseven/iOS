//
//  ContentView.swift
//  WeSplit
//
//  Created by seven on 2024/7/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                Form {
                       Section {
                           Text("Hello, world!")
                       }
                   }
                   .navigationTitle("SwiftUI")
            }
            .padding()
        } else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    ContentView()
}
