//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by seven on 2025/9/18.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
