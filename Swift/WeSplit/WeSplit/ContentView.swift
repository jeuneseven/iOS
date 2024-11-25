//
//  ContentView.swift
//  WeSplit
//
//  Created by seven on 2024/7/18.
//
// contains the initial user interface (UI) for your program, and is where we’ll be doing all the work in this project.
import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    // will return something that conforms to the View protocol, which is our layout
    var body: some View {
        Button("tapCount \(tapCount)") {
            tapCount += 1;
        }
        
//        VStack () {
//            Image(systemName: "globe")
//                .imageScale(.large) // View modifier
//                .foregroundStyle(.tint) // View modifier
//            Text("Hello World!")
//        }
//        .padding() // View modifier
//        if #available(iOS 16.0, *) {
//            NavigationStack {
//                Form() {
//                    Section {
//                        HStack () {
//                            Image(systemName: "globe")
//                                .imageScale(.large)
//                                .foregroundStyle(.tint)
//                            Text("Hello World!")
//                        }
//                        .padding()
//                    }
//                    
//                    Section {
//                        HStack () {
//                            Image(systemName: "globe")
//                                .imageScale(.large)
//                                .foregroundStyle(.tint)
//                            Text("Hello World!")
//                        }
//                        .padding()
//                        
//                        HStack () {
//                            Image(systemName: "globe")
//                                .imageScale(.large)
//                                .foregroundStyle(.tint)
//                            Text("Hello World!")
//                        }
//                        .padding()
//                    }
//                }
//                .navigationTitle("SwiftUI")
//                .navigationBarTitleDisplayMode(.inline)
//            }
//        } else {
//            // Fallback on earlier versions
//        }
    }
}
// This is a special piece of code that won’t actually form part of your final app that goes to the App Store, but is instead specifically for Xcode to use so it can show a preview of your UI design alongside your code.
#Preview {
    ContentView()
}
