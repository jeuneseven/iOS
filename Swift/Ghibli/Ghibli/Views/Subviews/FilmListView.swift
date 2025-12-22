//
//  FilmListView.swift
//  Ghibli
//
//  Created by seven on 2025/11/2.
//

import SwiftUI

struct FilmListView: View {
    var films: [Film]
    let favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        List(films) { film in
            NavigationLink(value: film) {
                FilmRow(film: film, favoritesViewModel: favoritesViewModel)
            }
        }
        .navigationDestination(for: Film.self) { film in
            FilmDetailView(film: film, favoritesViewModel: favoritesViewModel)
        }
    }
}

private struct FilmRow: View {
    let film: Film
    let favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            FilmImageView(imageURL: film.image)
                .frame(width: 100, height: 150)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(film.title)
                        .bold()
                    
                    Spacer()
                        
                    FavoriteButton(favoritesViewModel: favoritesViewModel, filmID: film.id)
                    .buttonStyle(.plain)
                    .controlSize(.large)
                }
                .padding(.bottom, 5)
                
                Text("Directed by \(film.director)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Released: \(film.releaseYear)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.top)
        }
    }
}

#Preview {
    @State @Previewable var vm = FilmsViewModel(service: MockGhibliService())
    @State @Previewable var favorites = FavoritesViewModel(service: MockFavoriteStorage())
    FilmListView(films: [Film.example, Film.exampleFavorite], favoritesViewModel: favorites)
        .task {
            await vm.fetch()
            favorites.load()
        }
}
