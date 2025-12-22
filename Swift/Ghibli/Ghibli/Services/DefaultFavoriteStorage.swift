//
//  DefaultFavoriteStorge.swift
//  Ghibli
//
//  Created by seven on 2025/12/22.
//

import Foundation

struct DefaultFavoriteStorage: FavoriteStorage {
    private let favoritesKey = "GhibliExplorer.FavoriteFilms"
    
    func load() -> Set<String> {
        let array = UserDefaults.standard.stringArray(forKey: favoritesKey) ?? []
        return Set(array)
    }
    
    func save(favoriteIDs: Set<String>) {
        UserDefaults.standard.set(Array(favoriteIDs), forKey: favoritesKey)
    }
}
