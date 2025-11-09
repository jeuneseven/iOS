//
//  EditTodoItemView.swift
//  TodoList
//
//  Created by seven on 2025/9/11.
//

import SwiftUI

struct EditTodoItemView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var todoItem: TodoItem
    
    var body: some View {
        NavigationStack {
            Form {
                HStack {
                    TextField("Enter your todo Item", text: $todoItem.name)
                }
            }
            .navigationTitle("Add New Item")
            .toolbar {
                Button("Save") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    EditTodoItemView(todoItem: TodoItem(id: UUID(), name: ""))
}
