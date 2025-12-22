//
//  MoviesView.swift
//  Ghibli
//
//  Created by seven on 2025/12/22.
//

import SwiftUI

struct MoviesView: View {
    let filmsViewModel: FilmsViewModel
    let favoriteViewModel: FavoritesViewModel
    var body: some View {
        NavigationStack {
            Group {
                switch filmsViewModel.state {
                case .idle:
                    Text("No films yet")
                case .loading:
                    ProgressView {
                        Text("Loading...")
                    }
                case .loaded(let films):
                    FilmListView(films: films, favoritesViewModel: favoriteViewModel)
                case .error(let error):
                    Text(error)
                        .foregroundStyle(.red)
                }
            }
            .navigationTitle(Constants.Strings.moviesTitle)
        }
        .task {
            await filmsViewModel.fetch()
        }
    }
}

#Preview {
    MoviesView(filmsViewModel: FilmsViewModel(service: MockGhibliService()), favoriteViewModel: FavoritesViewModel(service: MockFavoriteStorage()))
}
