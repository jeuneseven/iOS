//
//  TodoItem.swift
//  TodoList
//
//  Created by seven on 2025/8/17.
//

import Foundation
import Observation

@Observable
class TodoItem: Identifiable, Codable {
    var id: UUID = UUID()
    
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
