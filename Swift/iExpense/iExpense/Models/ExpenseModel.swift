//
//  ExpenseModel.swift
//  iExpense
//
//  Created by seven on 2025/8/27.
//

import Foundation

//enum ExpenseType {
//case Business = "Business", Personal = "Personal"
//}

// Identifiable protocol means this kind data can be identify somehow, e.g. id
struct ExpenseModel: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
