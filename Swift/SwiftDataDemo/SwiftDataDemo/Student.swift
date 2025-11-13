//
//  Student.swift
//  SwiftDataDemo
//
//  Created by seven on 2025/8/31.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
