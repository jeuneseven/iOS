//
//  OrderModel.swift
//  CupcakeCorner
//
//  Created by seven on 2025/8/30.
//

import Foundation
import Observation

@Observable
class OrderModel: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _city = "city"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _name = "name"
        case _extraFrosting = "extraFrosting"
        case _zip = "zip"
        case _quantity = "quantity"
        case _addSprinkles = "addSprinkles"
        case _streetAddress = "streetAddress"
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return true
        }
        
        return false
    }
    
    var cost: Decimal { // Decimal is better than Double in money, it treat each item as Int
        var cost = Decimal(quantity) * 2
        
        cost += (Decimal(type) / 2)
        
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
}
