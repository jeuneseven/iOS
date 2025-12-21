//
//  Favorites.swift
//  SnowSeeker
//
//  Created by seven on 2025/9/7.
//

import SwiftUI
import Observation

@Observable
class Favorites {
    private var resorts: Set<String>
    static private let key = "Favorites"
    
    let url = URL.documentsDirectory.appending(path: key)
    
    init() {
        if let data = try? Data(contentsOf: url) {
            if let savedResorts = try? JSONDecoder().decode(Set<String>.self, from: data) {
                resorts = savedResorts
                return
            }
        }
        
        resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(resorts) {
           try? encoded.write(to: url)
        }
    }
}
