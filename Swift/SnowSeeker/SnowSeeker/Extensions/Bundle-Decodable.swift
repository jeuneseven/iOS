//
//  Bundle-Decodable.swift
//  SnowSeeker
//
//  Created by seven on 2025/9/7.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ fileName: String) -> T {
        guard let url = self.url(forResource: fileName, withExtension: nil) else { fatalError("Failed to locate file \(fileName) in the bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(fileName) in the bundle")
        }
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
