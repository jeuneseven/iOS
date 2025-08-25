//
//  BasicView.swift
//  WeSplit
//
//  Created by seven on 2025/8/25.
//

import SwiftUI

struct BasicView: View {
    // @State is property wraper
    @State private var name = ""
    
    let options = ["A", "B", "C", "D"]
    @State private var selectedOption = "A"

    var body: some View {
        Form {
            Picker("Select an option", selection: $selectedOption) {
                ForEach(options, id: \.self) { // id: \.self: SwiftUI needs to be able to identify every view on the screen uniquely, the strings themselves are unique. If the options is ["A", "A" ...] will be have problems
                    Text($0)
                }
            }
        }
        
//        Form {
//            ForEach(0..<100) {
//                Text("Row \($0)")
//            }
//        }
        
//        Form {
//            TextField("Enter your name", text: $name) // $name is two way binding, change both write and read
//            Text("Your name is \(name)") // only read
//        }
        
//        NavigationStack {
//            Form {
//                Section("Section title") {
//                    Text("Text")
//                }
//                
//                Section("Section title") {
//                    Text("Text")
//                    Text("Text")
//                    Text("Text")
//                }
//                
//                Section("Section title") {
//                    Text("Text")
//                    Text("Text")
//                    Text("Text")
//                }
//            }
//            .navigationTitle("SwiftUI")
//            .navigationBarTitleDisplayMode(.automatic)
//        }
    }
}
// This is a special piece of code that won’t actually form part of your final app that goes to the App Store, but is instead specifically for Xcode to use so it can show a preview of your UI design alongside your code.
#Preview {
    BasicView()
}
