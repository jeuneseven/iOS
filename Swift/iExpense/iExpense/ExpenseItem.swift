//
//  ExpenseItem.swift
//  iExpense
//
//  Created by seven on 2025/8/17.
//

import Foundation

// Identifiable means this kind data can be identify somehow
struct ExpenseItem: Identifiable, Codable {
    var id: UUID = UUID()
    
    let name: String
    let type: String
    let amount: Double
}
