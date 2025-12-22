//
//  FilmDetailView.swift
//  Ghibli
//
//  Created by seven on 2025/11/6.
//

import SwiftUI

struct FilmDetailView: View {
    let film: Film
    let favoritesViewModel: FavoritesViewModel
    
    @State private var viewModel = FilmDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                FilmImageView(imageURL: film.bannerImage)
                    .frame(height: 300)
                
                VStack(alignment: .leading) {
                    Text(film.title)
                    
                    Divider()
                    
                    Text("Characters")
                        .font(.title3)
                    
                    switch viewModel.state {
                    case .idle:
                        EmptyView()
                    case .loading:
                        ProgressView()
                    case .loaded(let people):
                        ForEach(people) { person in
                            Text(person.name)
                        }
                    case .error(let error):
                        Text(error)
                            .foregroundStyle(.red)
                    }
                }
                .padding()
            }
        }
        .toolbar {
            FavoriteButton(favoritesViewModel: favoritesViewModel, filmID: film.id)
        }
        .task {
            await viewModel.fetch(for: film)
        }
    }
}

#Preview {
    NavigationStack {
        FilmDetailView(film: Film.example, favoritesViewModel: FavoritesViewModel(service: MockFavoriteStorage()))
    }
}
