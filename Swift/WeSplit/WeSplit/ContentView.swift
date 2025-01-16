//
//  ContentView.swift
//  WeSplit
//
//  Created by seven on 2024/7/18.
//
// contains the initial user interface (UI) for your program, and is where we’ll be doing all the work in this project.
import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Section {
                Text("Hello, world!")
                Text("Hello, world!")
            }
            Group {
                Text("Hello, world!")
                Text("Hello, world!")
            }
            Section {
                Text("Hello, world!")
                Text("Hello, world!")
            }
        }
    }
}
// This is a special piece of code that won’t actually form part of your final app that goes to the App Store, but is instead specifically for Xcode to use so it can show a preview of your UI design alongside your code.
#Preview {
    ContentView()
}
