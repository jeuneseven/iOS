//
//  Landmark.swift
//  Landmarks
//
//  Created by seven on 2025/9/6.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Identifiable, Codable, Hashable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    var isFavorite: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    struct Coordinates: Codable, Hashable {
        var longitude: Double
        var latitude: Double
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}
