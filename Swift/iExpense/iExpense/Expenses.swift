//
//  Expenses.swift
//  iExpense
//
//  Created by seven on 2025/8/17.
//

import Foundation

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItem = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems  = try? JSONDecoder().decode([ExpenseItem].self, from: savedItem) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
