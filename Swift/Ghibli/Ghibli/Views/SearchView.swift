//
//  SearchView.swift
//  Ghibli
//
//  Created by seven on 2025/12/22.
//

import SwiftUI

struct SearchView: View {
    @State private var text = ""
    @State private var searchViewModel: SearchFilmsViewModel
    let favoritesViewModel: FavoritesViewModel
    
    init(favoritesViewModel: FavoritesViewModel, service: GhibliService = DefaultGhibliService()) {
        self.favoritesViewModel = favoritesViewModel
        self.searchViewModel = SearchFilmsViewModel(service: service)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                switch searchViewModel.state {
                case .idle:
                    Text("Show search here")
                case .loading:
                    ProgressView()
                case .loaded(let films):
                    FilmListView(films: films, favoritesViewModel: favoritesViewModel)
                case .error(let error):
                    Text(error)
                }
            }
            .searchable(text: $text)
            .task(id: text) {
                await searchViewModel.fetch(for: text)
            }
        }
    }
}

#Preview {
    SearchView(favoritesViewModel: FavoritesViewModel(service: MockFavoriteStorage()))
}
