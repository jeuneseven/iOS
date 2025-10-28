//
//  ContentView.swift
//  iExpense
//
//  Created by seven on 2025/7/13.
//

import Observation
import SwiftUI

//struct SomeStruct {
//    var someVarValue: String = ""
//}
//
//class SomeClass: ObservableObject {
//    @Published var someVarValue: String = ""
//}

struct ContentView: View {
//    @State private var structObject = SomeStruct()
//    // when need to observe class, the class need to conform ObservableObject protocol, the instance need to marked @StateObject and it only used in created an instance, otherwise use @ObservedObject
//    @StateObject private var classObject = SomeClass()
        
//    @State private var aUser = UserStruct(firstName: "Kai", lastName: "Lee")
    
    @State private var expenses = Expenses()
    @State private var isShownAdd = false
    
    var body: some View {
        NavigationStack {
            List {
                // as ExpenseItem is Identifiable, id: \.id can be removed
                ForEach(expenses.items, id:\.id) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    isShownAdd = true
//                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 1)
//                    expenses.items.append(expense)
                }
            }
            .sheet(isPresented: $isShownAdd) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
