//
//  Film.swift
//  Ghibli
//
//  Created by seven on 2025/11/2.
//

import Foundation

struct Film: Codable, Identifiable, Equatable, Hashable {
    let id: String
    let title: String
    let description: String
    let director: String
    let producer: String
    
    let releaseYear: String
    let score: String
    let duration: String
    let image: String
    let bannerImage: String
    
    let people: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, title, image, description, director, producer, people
        case bannerImage = "movie_banner"
        case releaseYear = "release_date"
        case duration = "running_time"
        case score = "rt_score"
    }
    
    static var example: Film {
        MockGhibliService().fetchFilm()
    }
    
    init(id: String, title: String, description: String, director: String, producer: String, releaseYear: String, score: String, duration: String, image: String, bannerImage: String, people: [String]) {
        self.id = id
        self.title = title
        self.description = description
        self.director = director
        self.producer = producer
        self.releaseYear = releaseYear
        self.score = score
        self.duration = duration
        self.image = image
        self.bannerImage = bannerImage
        self.people = people
    }
}
