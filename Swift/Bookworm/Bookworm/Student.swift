//
//  Student.swift
//  Bookworm
//
//  Created by seven on 2025/8/19.
//

import Foundation
import Observation
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
