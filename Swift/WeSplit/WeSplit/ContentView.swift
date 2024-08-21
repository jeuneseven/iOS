//
//  ContentView.swift
//  WeSplit
//
//  Created by seven on 2024/7/18.
//

import SwiftUI
//conform View protocol, must return some view
struct ContentView: View {
//    @State private var tapCount = 0
//    @State private var name = ""
//    
//    let students = ["Harry", "Hermione", "Ron"]
//        @State private var selectedStudent = "Harry"
    
//    @State private var checkAmount = 0.0
//    @State private var numberOfPeople = 2
//    @State private var tipPercentage = 20
    
    var body: some View {
        Text("")
//        Form {
//            Section {
//                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//            }
//
//            Section {
//                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//                    .keyboardType(.decimalPad)
//            }
//        }
//        NavigationStack {
//            Form {
//                Section {
//                    TextField("Enter your name: ", text: self.$name)
//                    Text("Your name is \(name)")
//                }
//                
//                Section {
//                    ForEach(0..<10) {
//                        Text("row \($0)")
//                    }
//                }
//                
//                Section {
//                    Picker("Select your student", selection: $selectedStudent) {
//                                        //the strings themselves are unique.
//                                        ForEach(students, id: \.self) {
//                                            Text($0)
//                                        }
//                                    }
//                }
//            }
//            .navigationTitle("Title")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//        
//        Button("tapCount : \(tapCount)") {
//            self.tapCount += 1
//        }
    }
}

#Preview {
    ContentView()
}
