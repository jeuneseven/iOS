//
//  Facility.swift
//  SnowSeeker
//
//  Created by seven on 2025/9/7.
//

import SwiftUI

struct Facility: Identifiable {
    let id = UUID()
    var name: String
    
    private let icons = [
        "Accommodation" : "house",
        "Beginners" : "1.circle",
        "Cross-country" : "map",
        "Eco-friendly" : "leaf.arrow.circlepath",
        "Family" : "person.3"
    ]
    
    private let descriptions = [
        "Accommodation" : "Accommodation",
        "Beginners" : "Beginners",
        "Cross-country" : "Cross-country",
        "Eco-friendly" : "Eco-friendly",
        "Family" : "Family"
    ]
    
    var icon: some View {
        if let iconName = icons[name] {
            Image(systemName: iconName)
                .accessibilityLabel(name)
                .foregroundStyle(.secondary)
        } else {
            fatalError("Unknown facility type: \(name)")
        }
    }
    
    var description: String {
        if let message = descriptions[name] {
            message
        } else {
            fatalError("Unknown facility type: \(name)")
        }
    }
}
