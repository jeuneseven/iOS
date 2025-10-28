//
//  AddExpenseView.swift
//  iExpense
//
//  Created by seven on 2025/8/27.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    var expenses: ExpensesList
    @State private var viewModel = AddExpenseViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense name", text: $viewModel.name)
                    .keyboardType(.default)
                
                Picker("Expense type", selection: $viewModel.type) {
                    ForEach(viewModel.expenseTypes, id:\.self) {
                        Text($0)
                    }
                }
                
                TextField("Expense amount", value: $viewModel.amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Done") {
                    viewModel.expenses = expenses
                    viewModel.save()
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddExpenseView(expenses: ExpensesList())
}
