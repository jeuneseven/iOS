//
//  TodoList.swift
//  TodoList
//
//  Created by seven on 2025/8/17.
//

import Foundation
import Observation

@Observable
class TodoList {
    let url = URL.documentsDirectory.appending(path: "todolist")
    
    var items = [TodoItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                encoded.write(to: url)
            }
        }
    }
    
    init() {
        if let data = try? Data(contentsOf: url) {
            if let savedItems = try? JSONDecoder().decode([TodoItem].self, from: data) {
                items = savedItems
                return
            }
        }
        
        items = []
    }
}
