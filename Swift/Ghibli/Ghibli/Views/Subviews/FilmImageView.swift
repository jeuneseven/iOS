//
//  FilmImageView.swift
//  Ghibli
//
//  Created by seven on 2025/12/21.
//

import SwiftUI

struct FilmImageView: View {
    let imageURL: URL?
    
    init(imageURL: String) {
        self.imageURL = URL(string: imageURL)
    }
    
    init(url: URL?) {
        self.imageURL = url
    }
    
    var body: some View {
        AsyncImage(url: imageURL) {
            phase in
            switch phase {
            case .empty:
                Color(white: 0.8)
                    .overlay {
                        ProgressView()
                            .controlSize(.large)
                    }
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .clipped()
            case .failure(let error):
                Text("Could not load image \(error.localizedDescription)")
            @unknown default:
                fatalError()
            }
        }
    }
}

#Preview("poster image") {
    FilmImageView(url: URL.convertAssetImage(named: "posterImage"))
        .frame(height: 150)
}

#Preview("banner image") {
    FilmImageView(url: URL.convertAssetImage(named: "bannerImage"))
        .frame(height: 300)
}
