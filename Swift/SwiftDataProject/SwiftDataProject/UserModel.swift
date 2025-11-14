//
//  UserModel.swift
//  SwiftDataProject
//
//  Created by seven on 2025/9/1.
//

import Foundation
import SwiftData

@Model	
class UserModel {
    static let example = UserModel(name: "Swift", city: "Auckland", joinDate: .now)
    
    var name: String
    var city: String
    var joinDate: Date
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
