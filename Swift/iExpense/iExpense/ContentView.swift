//
//  ContentView.swift
//  iExpense
//
//  Created by seven on 2025/7/13.
//

import Observation
import SwiftUI

struct PresentView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button("Dismiss") {
                    dismiss()
                }
                .padding()
            }
            
            Spacer()
            
            Text("Hello \(name)")
            
            Spacer()
        }
    }
}

@Observable // all UI update are rely on @Observable rather than @State, can use right click expand macro to see what happens
class User {
    var firstName: String = "Kai"
    var lastName: String = "Lee"
}

struct UserStruct:Codable { // Codable can make sure encode and decode in order to archive and unarchive
    let firstName: String
    let lastName: String
}
// Identifiable means this kind data can be identify somehow
struct ExpenseItem: Identifiable, Codable {
    var id: UUID = UUID()
    
    let name: String
    let type: String
    let amount: Double
}

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

struct ContentView: View {
//    @State private var user = User()
    
//    @State private var isShown = false
    
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
//    
//    @State private var aUser = UserStruct(firstName: "Kai", lastName: "Lee")
    
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "tap_count")
//    @AppStorage("tapCount") private var tapCount = 0
    
    @State private var expenses = Expenses()
    @State private var isShownAdd = false
    
    var body: some View {
        NavigationStack {
            List {
                // as ExpenseItem is Identifiable, id: \.id can be removed
                ForEach(expenses.items) { item in
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
                .onDelete(perform: removeItem)
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
        
//        Button("Save User") {
//            let encoder = JSONEncoder()
//            if let data = try? encoder.encode(aUser) {
//                UserDefaults.standard.set(data, forKey: "UserData")
//            }
//        }
        
//        Button("Tap count: \(tapCount)") {
//            tapCount += 1
//            UserDefaults.standard.setValue(tapCount, forKey: "tap_count")
////            UserDefaults.standard.synchronize() // not recommand, unless must save
//        }
//        NavigationStack {
//            VStack {
//                List {
//                    ForEach(numbers, id: \.self) {
//                        Text("Row \($0)")
//                    }
//                    .onDelete(perform: removeRow)
//                }
//                
//                Button("Add Row") {
//                    numbers.append(currentNumber)
//                    currentNumber += 1
//                }
//            }
//            .toolbar {
//                EditButton()
//            }
//        }
        
//        Button("Present View") {
//            isShown.toggle()
//        }
//        .sheet(isPresented: $isShown) {
//            PresentView(name: "Kai")
//        }
        
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName)")
//            
//            TextField("first name: ", text:$user.firstName) // every time user type in, an instance of User(struct) will be create
//            TextField("last name: ", text:$user.lastName)
//        }
//        .padding()
    }
    
    func removeItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
//    func removeRow(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
}

#Preview {
    ContentView()
}
