//
//  ContentView.swift
//  WeSplit
//
//  Created by seven on 2024/7/18.
//

import SwiftUI
//conform View protocol, must return some view
struct ContentView: View {
    var totalPerPerson: Double {
        // calculate the total per person here
        return 0
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    @State private var tapCount = 0
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
        @State private var selectedStudent = "Harry"
    
    let tipPercentages = [20, 40, 60, 80]
    
    @FocusState private var amountIsFocused: Bool

    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let peopleCount = Double(numberOfPeople + 2)
    let tipSelection = Double(tipPercentage)

    
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
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
            
            Section("How much tip do you want to leave?") {
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(tipPercentages, id: \.self) {
                        Text($0, format: .percent)
                    }
                }
                .pickerStyle(.segmented)
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
