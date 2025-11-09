//
//  Bundle-Decoder.swift
//  TheElements
//
//  Created by seven on 2025/9/10.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ fileName: String) -> T {
        guard let url = self.url(forResource: fileName, withExtension: nil) else {
            fatalError("Failed to load url from bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load data from url")
        }
        
//        let object = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil)
//        print("Root object:", object as Any)
        
        do {
            return try PropertyListDecoder().decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(fileName) from bundle due to missing key '\(key.stringValue)' – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(fileName) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(fileName) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(fileName) from bundle because it appears to be invalid Plist.")
        } catch {
            fatalError("Failed to decode \(fileName) from bundle: \(error.localizedDescription)")
        }
    }
}
