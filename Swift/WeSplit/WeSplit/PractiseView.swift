//
//  PractiseView.swift
//  WeSplit
//
//  Created by seven on 2025/8/25.
//

import SwiftUI

struct PractiseView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 10
    
    @FocusState private var isCheckAmountFocus: Bool

    let tipPercentages = [10, 15, 20, 25, 0]
    let currencyCode = Locale.current.currency?.identifier ?? "USD"
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount * (tipSelection / 100)
        let grandTotal = checkAmount + tipValue
        let perPerson = grandTotal / peopleCount
        
        return perPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    // use value rather than text, as TextField treat double as value
                    TextField("Amount", value: $checkAmount, format: .currency(code: currencyCode))
                    //                .labelsHidden()
                        .keyboardType(.decimalPad) // decimalPad will remove something is not related to number
                        .focused($isCheckAmountFocus)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<10) {
                            Text("\($0) people")
                        }
                    }
                    // a good example of declarative programm
                    .pickerStyle(.navigationLink)
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id:\.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: { // same as Section("How much do you want to tip?")
                    Text("How much do you want to tip?")
                }

                Section {
                    Text(totalPerPerson, format: .currency(code: currencyCode))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                Button("Done") {
                    if isCheckAmountFocus {
                        isCheckAmountFocus = false
                    }
                }
            }
        }
    }
}

#Preview {
    PractiseView()
}
