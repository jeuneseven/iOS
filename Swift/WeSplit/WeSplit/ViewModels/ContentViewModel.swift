//
//  ContentViewModel.swift
//  WeSplit
//
//  Created by seven on 2025/9/8.
//

import SwiftUI
import Foundation
import Observation

extension ContentView {
    @Observable
    class ViewModel {
        var checkAmount = 0.0
        var numberOfPeople = 0
        var tipPercentage = 20
        
        let tipPercentages = [10, 15, 20, 25, 0]
        
        var totalPerPerson: Double {
            let peopleCount = Double(numberOfPeople + 2)
            let tipSelection = Double(tipPercentage)
            
            let tipValue = checkAmount * (tipSelection / 100)
            let grandTotal = checkAmount + tipValue
            let perPerson = grandTotal / peopleCount
            
            return perPerson
        }
    }
}
