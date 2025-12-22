//
//  FavoriteStorge.swift
//  Ghibli
//
//  Created by seven on 2025/12/22.
//

import Foundation

protocol FavoriteStorage {
    func load() -> Set<String>
    func save(favoriteIDs: Set<String>)
}
