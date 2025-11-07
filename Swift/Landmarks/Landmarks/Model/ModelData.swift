//
//  ModelData.swift
//  Landmarks
//
//  Created by seven on 2025/9/6.
//

import Foundation
import Observation

@Observable
class ModelData {
    var landmarks: [Landmark] = Bundle.main.decode("landmarkData.json")
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

extension Bundle {
    func decode<T: Codable>(_ fileName: String) -> T {
        guard let file = Self.main.url(forResource: fileName, withExtension: nil) else { fatalError() }
        
        guard let data = try? Data(contentsOf: file) else { fatalError()  }
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError()
        }
    }
}
