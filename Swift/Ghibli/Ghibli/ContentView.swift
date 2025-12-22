//
//  ContentView.swift
//  Ghibli
//
//  Created by seven on 2025/11/2.
//

import SwiftUI

struct ContentView: View {
    @State private var filmsViewModel = FilmsViewModel()
    @State private var favoritesViewModel = FavoritesViewModel()
    
    var body: some View {
        TabView {
            Tab(Constants.Strings.moviesTab,
                systemImage: Constants.Design.movieTabImage) {
                MoviesView(filmsViewModel: filmsViewModel, favoriteViewModel: favoritesViewModel)
            }
            
            Tab(Constants.Strings.favoritesTab,
                systemImage: Constants.Design.favoritesTabImage) {
                FavoritesView(filmsViewModel: filmsViewModel, favoritesViewModel: favoritesViewModel)
            }
            
            Tab(Constants.Strings.settingsTab,
                systemImage: Constants.Design.settingsTabImage) {
                SettingsView()
            }
            
            Tab(role: .search) {
                SearchView()
            }
        }
        .task {
            favoritesViewModel.load()
        }
    }
}

#Preview {
    ContentView()
}
