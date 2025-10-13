//
//  File.swift
//  GuessTheFlag
//
//  Created by seven on 2025/8/29.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let loadFile = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to load file \(file)")
        }
        guard let data = try? Data(contentsOf: loadFile) else {
            fatalError("Failed to load data in file \(file)")
        }
        
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Failed to decode data in file \(file)")
        }
    }
}
