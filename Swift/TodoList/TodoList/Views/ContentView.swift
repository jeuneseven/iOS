//
//  ContentView.swift
//  TodoList
//
//  Created by seven on 2024/6/16.
//

import SwiftUI

struct ContentView: View {
    @State private var todolist = TodoList()
    @State private var isShownAddNewView = false
    
    @State private var searchText = ""
    
    var filteredResult: [TodoItem] {
        if searchText.isEmpty {
            todolist.items
        } else {
            todolist.items.filter {
                $0.name.localizedStandardContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredResult) { item in
                    NavigationLink {
                        EditTodoItemView(todoItem: item)
                    } label: {
                        Text(item.name)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Todo List")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus") {
                        isShownAddNewView = true
                    }
                }
            }
            .sheet(isPresented: $isShownAddNewView) {
                AddTodoItemView(todolist: todolist)
            }
            .searchable(text: $searchText, prompt: "Search for a todo")
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        todolist.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
