//
//  PractiseViewModel.swift
//  iExpense
//
//  Created by seven on 2025/9/10.
//

import Foundation
import Observation

@Observable
class PractiseViewModel {
    var expenses = ExpensesList()
    var isShowingAddExpenseView = false
    
    func deleteItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}
