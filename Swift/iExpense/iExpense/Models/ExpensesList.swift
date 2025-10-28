//
//  ExpensesList.swift
//  iExpense
//
//  Created by seven on 2025/8/27.
//

import Foundation
import Observation

@Observable
class ExpensesList {
    let savedKey = "ExpenseItems"
    
    var items = [ExpenseModel]() {
        didSet {
            if let encodeData = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodeData, forKey: savedKey)
            }
        }
    }
    
    init() {
        if let savedItem = UserDefaults.standard.data(forKey: savedKey) {
            if let decodeData = try? JSONDecoder().decode([ExpenseModel].self, from: savedItem) {
                items = decodeData
                return
            }
        }
        
        items = []
    }
}
