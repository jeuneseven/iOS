//
//  Bundle-Decodable.swift
//  ParaphraseSwiftUI
//
//  Created by seven on 2025/12/31.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Fail to locate \(file) from bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Fail to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
