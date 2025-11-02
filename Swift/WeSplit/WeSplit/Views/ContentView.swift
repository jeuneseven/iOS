//
//  ContentView.swift
//  WeSplit
//
//  Created by seven on 2024/7/18.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    @FocusState private var isCheckAmountFocus: Bool
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    // use value rather than text, as TextField treat double as value
                    TextField(Constants.Strings.amountTextFieldPlaceholder,
                              value: $viewModel.checkAmount,
                              format: .currency(code: Constants.Strings.currencyCode))
                    .keyboardType(.decimalPad) // decimalPad will remove something is not related to number
                    .focused($isCheckAmountFocus)
                    
                    Picker(Constants.Strings.numberOfPeoplePickerTip, selection: $viewModel.numberOfPeople) {
                        ForEach(2..<10) {
                            Text("\($0) people")
                        }
                    }
                    // a good example of declarative programm
                    .pickerStyle(.navigationLink)
                }
                 
                Section {
                    Text(viewModel.checkAmount, format: .currency(code: Constants.Strings.currencyCode))
                }
                
                Section {
                    Picker(Constants.Strings.tipPercentagePickerTip, selection: $viewModel.tipPercentage) {
                        ForEach(viewModel.tipPercentages, id:\.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: { // same as Section("How much do you want to tip?")
                    Text(Constants.Strings.tipPercentageSectionTitle)
                }
                
                Section {
                    Text(viewModel.totalPerPerson, format: .currency(code: Constants.Strings.currencyCode))
                }
            }
            .navigationTitle(Constants.Strings.navigationTitle)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button(Constants.Strings.toolBarButtonTitle) {
                        if isCheckAmountFocus {
                            isCheckAmountFocus = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
