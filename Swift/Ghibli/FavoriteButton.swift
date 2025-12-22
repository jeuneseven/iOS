//
//  FavoriteButton.swift
//  Ghibli
//
//  Created by seven on 2025/12/22.
//


import SwiftUI

struct FavoriteButton: View {
    let favoritesViewModel: FavoritesViewModel
    let filmID: String
    var isFavorite: Bool {
        favoritesViewModel.isFavorite(filmID: filmID)
    }
    
    var body: some View {
        Button {
            favoritesViewModel.toggleFavorite(filmID: filmID)
        } label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundStyle(isFavorite ? Color.red : Color.gray)
        }
    }
}