//
//  ContentView.swift
//  BetterRest
//
//  Created by seven on 2025/2/20.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $viewModel.wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }

                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(viewModel.sleepAmount.formatted()) hours", value: $viewModel.sleepAmount, in: 4...12, step: 0.25)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    Stepper("^[\(viewModel.coffeeAmount) cup](inflect: true)", value: $viewModel.coffeeAmount, in: 0...20)
                }
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: viewModel.calculateBedtime)
            }
            .alert(viewModel.alertTitle, isPresented: $viewModel.showingAlert) {
                Button("OK") { }
            } message: {
                Text(viewModel.alertMessage)
            }
        }
    }
}

#Preview {
    ContentView()
}
