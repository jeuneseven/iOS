//
//  ContentView.swift
//  WeSplit
//
//  Created by seven on 2024/7/18.
//
// contains the initial user interface (UI) for your program, and is where we’ll be doing all the work in this project.
import SwiftUI

struct ContentView: View {
    // will return something that conforms to the View protocol, which is our layout
    var body: some View {
        VStack () {
            Text("Hello World!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
