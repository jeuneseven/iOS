//
//  PractiseView.swift
//  WeSplit
//
//  Created by seven on 2025/8/25.
//

import SwiftUI

struct PractiseView: View {
    @State private var viewModel = PractiseViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                // as ExpenseModel is Identifiable, id: \.id can be removed
                ForEach(viewModel.expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
                .onDelete(perform: viewModel.deleteItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add new expense", systemImage: "plus") {
                    viewModel.isShowingAddExpenseView = true
                }
            }
            .sheet(isPresented: $viewModel.isShowingAddExpenseView) {
                AddExpenseView(expenses: viewModel.expenses)
            }
        }
    }
}

#Preview {
    PractiseView()
}
