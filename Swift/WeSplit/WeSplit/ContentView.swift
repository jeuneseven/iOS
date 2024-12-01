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
    // if you added duplicate strings to the people array you might hit problems
//    let people = ["A", "B", "C"]
//    @State private var selectedPeople = "A"
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson:Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    // will return something that conforms to the View protocol, which is our layout
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                Form {
                    Section {
                        TextField("Please input", value: $checkAmount, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach (2..<10){
                                Text("\($0) People")
                            }
                        }
                        .pickerStyle(.navigationLink)
                    }
                    
                    Section ("Select your tip") {
                        Picker("TipPercentage", selection: $tipPercentage) {
                            ForEach (tipPercentages, id:\.self) {
                                Text($0, format:.percent)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section {
                        Text(totalPerPerson, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
                .navigationTitle("WeSplit")
                .toolbar {
                    if amountIsFocused {
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
            }
        } else {
            // Fallback on earlier versions
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
