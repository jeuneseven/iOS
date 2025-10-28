//
//  ViewModel.swift
//  iExpense
//
//  Created by seven on 2025/9/10.
//

import Foundation
import Observation

@Observable
class AddExpenseViewModel {
    var name = ""
    var type = "Personal"
    var amount = 0.0
    
    let expenseTypes = ["Business", "Personal"]
    
    var expenses: ExpensesList?
    
    func save() {
        guard let expenses = expenses else { return }
        let item = ExpenseModel(name: name, type: type, amount: amount)
        expenses.items.append(item)
    }
}
