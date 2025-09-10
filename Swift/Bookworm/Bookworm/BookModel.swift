//
//  BookModel.swift
//  Bookworm
//
//  Created by seven on 2025/8/31.
//

import Foundation
import SwiftData

@Model
class BookModel {
    static let example = BookModel(title: "Test title", genre: "Fantasy", author: "Test author", review: "Great book!", rating: 5)
    
    var title: String
    var genre: String
    var author: String
    var review: String
    var rating: Int
    
    init(title: String, genre: String, author: String, review: String, rating: Int) {
        self.title = title
        self.genre = genre
        self.author = author
        self.review = review
        self.rating = rating
    }
}
