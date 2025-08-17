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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todolist.items) { item in
                    HStack {
                        VStack {
                            Text(item.name)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Todo List")
            .toolbar {
                Button("Add", systemImage: "plus") {
                    isShownAddNewView = true
                }
            }
            .sheet(isPresented: $isShownAddNewView) {
                AddNewTodoItem(todolist: todolist)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        todolist.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//#Preview {
//    ContentView()
//}
