//
//  Book.swift
//  Bookworm
//
//  Created by seven on 2025/8/20.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var rating: Int
    var genre: String
    var review: String
    
    init(title: String, author: String, rating: Int, genre: String, review: String) {
        self.title = title
        self.author = author
        self.rating = rating
        self.genre = genre
        self.review = review
    }
}
