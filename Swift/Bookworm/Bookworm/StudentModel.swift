//
//  StudentModel.swift
//  Bookworm
//
//  Created by seven on 2025/8/31.
//

import Foundation
import SwiftData

@Model // @Model macro built on the same observation system used by the @Observable macro
class StudentModel {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
