//
//  ContentView.swift
//  WeSplit
//
//  Created by seven on 2024/7/18.
//

import SwiftUI
//conform View protocol, must return some view
struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)


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
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
            
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
