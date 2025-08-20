//
//  ContentView.swift
//  iExpense
//
//  Created by seven on 2025/7/13.
//

import Observation
import SwiftUI

//struct PresentView: View {
//    @Environment(\.dismiss) var dismiss
//    
//    let name: String
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Spacer()
//                
//                Button("Dismiss") {
//                    dismiss()
//                }
//                .padding()
//            }
//            
//            Spacer()
//            
//            Text("Hello \(name)")
//            
//            Spacer()
//        }
//    }
//}

//@Observable // all UI update are rely on @Observable rather than @State, can use right click expand macro to see what happens
//class User {
//    var firstName: String = "Kai"
//    var lastName: String = "Lee"
//}

//struct UserStruct:Codable { // Codable can make sure encode and decode in order to archive and unarchive
//    let firstName: String
//    let lastName: String
//}

//struct SomeStruct {
//    var someVarValue: String = ""
//}
//
//class SomeClass: ObservableObject {
//    @Published var someVarValue: String = ""
//}
//
//struct SecondView: View {
//    let name: String
//    
//    var body: some View {
//        Text("Hello \(name)!")
//    }
//}

//struct AppStorageKeys {
//    static let tapCount = "tapCount"
//}

struct ContentView: View {
//    @State private var structObject = SomeStruct()
//    // when need to observe class, the class need to conform ObservableObject protocol, the instance need to marked @StateObject and it only used in created an instance, otherwise use @ObservedObject
//    @StateObject private var classObject = SomeClass()
    
//    @State private var user = User()
    
//    @State private var isShown = false
    
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
////    
//    @State private var aUser = UserStruct(firstName: "Kai", lastName: "Lee")
    
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "tap_count")
//    @AppStorage(AppStorageKeys.tapCount) private var tapCount = 0
    
    @State private var expenses = Expenses()
    @State private var isShownAdd = false
    
//    @State private var isShownSheet = false
    
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
        
//        Button("Save User") {
//            let encoder = JSONEncoder()
//            if let data = try? encoder.encode(aUser) {
//                UserDefaults.standard.set(data, forKey: "UserData")
//            }
//        }
        
//        Button("Tap count: \(tapCount)") {
//            tapCount += 1
////            UserDefaults.standard.setValue(tapCount, forKey: "tap_count")
////            UserDefaults.standard.synchronize() // not recommand, unless must save
//        }
//        NavigationStack {
//            VStack {
//                List {
//                    ForEach(numbers, id: \.self) {
//                        Text("Row \($0)")
//                    }
//                    // onDelete modifier only exists on for each
//                    .onDelete(perform: removeRows)
//                }
//                
//                Button("Add Row") {
//                    numbers.append(currentNumber)
//                    currentNumber += 1
//                }
//            }
//            .navigationTitle("onDelete")
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
        
//        VStack {
////            Text("Your content is \(structObject.someVarValue)")
////            
////            TextField("Type your content", text: $structObject.someVarValue)
//            
//            Text("Your content is \(classObject.someVarValue)")
//            
//            TextField("Type your content", text: $classObject.someVarValue)
//        }
        
//        Button("Shown Sheet") {
//            isShownSheet.toggle()
//        }
//        .sheet(isPresented: $isShownSheet) {
//            SecondView(name: "World")
//        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
}

#Preview {
    ContentView()
}
