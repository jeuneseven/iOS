//
//  ContentView.swift
//  WeSplit
//
//  Created by seven on 2024/7/18.
//

import SwiftUI
//conform View protocol, must return some view
struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
        @State private var selectedStudent = "Harry"
    
    let tipPercentages = [20, 40, 60, 80]
    
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)

                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<10) {
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    TextField("Enter your name: ", text: self.$name)
                    Text("Your name is \(name)")
                }
                
                Section {
                    ForEach(0..<5) {
                        Text("row \($0)")
                    }
                }
                
                Section {
                    Picker("Select your student", selection: $selectedStudent) {
                                        //the strings themselves are unique.
                                        ForEach(students, id: \.self) {
                                            Text($0)
                                        }
                                    }
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
            
            Section {
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(tipPercentages, id: \.self) {
                        Text($0, format: .percent)
                    }
                }
            }
            
            Button("tapCount : \(tapCount)") {
                self.tapCount += 1
            }
        }
    }
}

#Preview {
    ContentView()
}
