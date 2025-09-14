//
//  Constants.swift
//  WeSplit
//
//  Created by seven on 2025/9/8.
//

import Foundation

struct Constants {
    struct Strings {
        static let navigationTitle = "WeSplit"
        static let toolBarButtonTitle = "Done"
        static let tipHint = "How much tip do you want to leave?"
        
        static let amountTextFieldPlaceholder = "Amount"
        static let currencyCode = Locale.current.currency?.identifier ?? "USD"
        
        static let numberOfPeoplePickerTip = "Number of People"
        
        static let tipPercentageSectionTitle = "How much do you want to tip?"
        static let tipPercentagePickerTip = "Tip percentage"
    }
}
