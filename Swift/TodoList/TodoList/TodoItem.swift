//
//  TodoItem.swift
//  TodoList
//
//  Created by seven on 2025/8/17.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    var id: UUID = UUID()
    
    var name: String
}
