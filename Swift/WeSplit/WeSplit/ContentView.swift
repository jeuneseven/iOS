//
//  ContentView.swift
//  WeSplit
//
//  Created by seven on 2024/7/18.
//

import SwiftUI
/**
 Core skills: Swift, SwiftUI(easier, built for Swift, works everywhere, future), Working with data, Networking, Version Control
 Extention skills: UIKit(popular, powerful, precise, proven), Core Data, Testing, Architecture, multithreading
 */
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
