//
//  BasicView.swift
//  SwiftDataProject
//
//  Created by seven on 2025/8/31.
//

import SwiftData
import SwiftUI

struct BasicView: View {
    @Environment(\.modelContext) var modelContext
//    @Query(filter: #Predicate<UserModel> { user in
//        if user.name.localizedStandardContains("A") {
//            if user.city == "London" {
//                return true
//            } else {
//                return false
//            }
//        } else {
//            return false
//        }
////        user.name.localizedStandardContains("A") &&
////        user.city == "London"
//    }, sort:\UserModel.name) var users: [UserModel]
//    @State private var path = [UserModel]()
    
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\UserModel.name),
        SortDescriptor(\UserModel.joinDate)
    ]
    var body: some View {
        NavigationStack {
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
//            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast)
//            List(users) { user in
//                Text(user.name)
//            }
            .navigationDestination(for: UserModel.self) { user in
                EditUserDataView(user: user)
            }
            .toolbar {
                Button("Add", systemImage: "plus") {
                    try? modelContext.delete(model: UserModel.self)
                    
                    let user1 = UserModel(name: "A", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let user2 = UserModel(name: "B", city: "London", joinDate: .now.addingTimeInterval(86400 * -5))
                    let user3 = UserModel(name: "C", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let user4 = UserModel(name: "D", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                    
                    modelContext.insert(user1)
                    modelContext.insert(user2)
                    modelContext.insert(user3)
                    modelContext.insert(user4)
                    try? modelContext.save()
                }
                
                Button(showingUpcomingOnly ? "Show everyone" : "Show upcoming") {
                    showingUpcomingOnly.toggle()
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\UserModel.name),
                                SortDescriptor(\UserModel.joinDate)
                            ])
                        
                        Text("Sort by JoinDate")
                            .tag([
                                SortDescriptor(\UserModel.joinDate),
                                SortDescriptor(\UserModel.name)
                            ])
                    }
                }
            }
            .navigationTitle("Users")
        }
        
//        NavigationStack(path: $path) {
//            List(users) { user in
//                NavigationLink(value: user) {
//                    Text(user.name)
//                }
//            }
//            .navigationDestination(for: UserModel.self) { user in
//                EditUserDataView(user: user)
//            }
//            .toolbar {
//                Button("Add", systemImage: "plus") {
//                    let user = UserModel(name: "", city: "", joinDate: .now)
//                    modelContext.insert(user)
//                    try? modelContext.save()
//                    
//                    path = [user]
//                }
//            }
//            .navigationTitle("Users")
//        }
    }
}

#Preview {
    BasicView()
}
