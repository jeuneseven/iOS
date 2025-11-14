//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by seven on 2025/8/20.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<User> { user in
        user.name.localizedStandardContains("B")
    }, sort: \User.name) var users: [User]
//    @Query(sort: \User.name) var users: [User]
//    @State private var path = [User]()
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)
                    
                    let first = User(name: "A", city: "C", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "B", city: "B", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "D", city: "D", joinDate: .now.addingTimeInterval(86400 * 5))
                    let forth = User(name: "F", city: "F", joinDate: .now.addingTimeInterval(86400 * 10))
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(forth)
                }
            }
        }
        
//        NavigationStack(path: $path) {
//            List(users) { user in
//                NavigationLink(value: user) {
//                    Text(user.name)
//                }
//            }
//            .navigationTitle("Users")
//            .navigationDestination(for: User.self) { user in
//                EditUserView(user: user)
//            }
//            .toolbar {
//                Button("Add User", systemImage: "plus") {
//                    let user = User(name: "", city: "", joinDate: .now)
//                    modelContext.insert(user)
//                    path = [user]
//                }
//            }
//        }
    }
}

#Preview {
    ContentView()
}
