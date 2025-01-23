//
//  ContentView.swift
//  WeSplit
//
//  Created by seven on 2024/7/18.
//
// contains the initial user interface (UI) for your program, and is where we’ll be doing all the work in this project.
import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                Form {
                    Section {
                        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .keyboardType(.decimalPad)
                        
                        Picker("Number of People", selection: $numberOfPeople) {
                            ForEach(2..<10) {
                                Text("\($0) people")
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
                    
                    Section {
                        Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    }
                }
                .navigationTitle("WeSplit")
            }
        } else {
            // Fallback on earlier versions
        }
    }
//    @State private var tapCount = 0
//    @State private var name = ""
//    
//    let array = ["A", "B", "C"]
//    @State private var selectedItem = "A"
//    
//    var body: some View {
//        if #available(iOS 16.0, *) {
//            NavigationStack {
//                Form {
//                    Section {
//                        Text("Hello, world!")
//                    }
//                    Group {
//                        Button("TapCount: \(tapCount)") {
//                            tapCount += 1
//                        }
//                    }
//                    Section {
//                        TextField("Enter your name", text: $name)
//                        Text("Your name is \(name)")
//                    }
//                    
//                    Section {
//                        Picker("Select one item", selection: $selectedItem) {
//                            // SwiftUI needs to be able to identify every view on the screen uniquely, the strings themselves are unique.
//                            ForEach(array, id: \.self) {
//                                Text($0)
//                            }
//                        }
//                    }
//                    
//                    Section {
//                        ForEach(0..<10) {
//                            Text("Row \($0)")
//                        }
//                    }
//                }
//                .navigationTitle("SwiftUI")
//            }
//        } else {
//            // Fallback on earlier versions
//        }
//    }
}
// This is a special piece of code that won’t actually form part of your final app that goes to the App Store, but is instead specifically for Xcode to use so it can show a preview of your UI design alongside your code.
#Preview {
    ContentView()
}
