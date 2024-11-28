//
//  ContentView.swift
//  WeSplit
//
//  Created by seven on 2024/7/18.
//
// contains the initial user interface (UI) for your program, and is where we’ll be doing all the work in this project.
import SwiftUI

struct ContentView: View {
//    @State private var name = ""
//    @State private var tapCount = 0
    
//    let people = ["A", "B", "C"]
//    @State private var selectedPeople = "A"
    
    @State private var check = 0.0
    
    // will return something that conforms to the View protocol, which is our layout
    var body: some View {
        Form {
            if #available(iOS 16, *) {
                TextField("Please input", value: $check, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            } else {
                TextField("Please input", value: $check, format:.currency(code:"USD"))
                    .keyboardType(.decimalPad)
            }
            if #available(iOS 16, *) {
                Text(check, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
            } else {
                TextField("Please input", value: $check, format:.currency(code:"USD"))
                    .keyboardType(.decimalPad)
            }
        }
        
//        Form () {
//            Picker("Selected people", selection: $selectedPeople) {
//                // SwiftUI needs to be able to identify every view on the screen uniquely, so it can detect when things change 
//                ForEach(people, id: \.self) {
//                    Text($0)
//                }
//            }
//        }
        
//        Form() {
//            ForEach(0..<10) { number in
//                Text("Row \(number)")
//            }
//            ForEach(0..<10) {
//                Text("Row \($0)")
//            }
//        }
        
//        Form () {
//            // In Swift, we mark these two-way bindings with a special symbol so they stand out: we write a dollar sign before them. This tells Swift that it should read the value of the property but also write it back as any changes happen.
//            TextField("Please enter your name", text: $name)
//            Text("Your name is \(name)")
//        }
//        Button("tapCount \(tapCount)") {
//            tapCount += 1;
//        }
        
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
