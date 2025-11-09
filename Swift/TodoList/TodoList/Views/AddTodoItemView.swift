//
//  AddNewTodoItem.swift
//  TodoList
//
//  Created by seven on 2025/8/17.
//

import SwiftUI

struct AddTodoItemView: View {
    @Environment(\.dismiss) var dismiss
    
    var todolist: TodoList
    
    @State private var name = ""
    
    var body: some View {
        NavigationStack {
            Form {
                HStack {
                    TextField("Enter your todo Item", text: $name)
                }
            }
            .navigationTitle("Add New Item")
            .toolbar {
                Button("Save") {
                    let item = TodoItem(id: UUID(), name: name)
                    todolist.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddTodoItemView(todolist: TodoList())
}
