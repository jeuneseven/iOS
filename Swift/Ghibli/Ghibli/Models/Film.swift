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
        //MockGhibliService().fetchFilm()
        let bannerULR = URL.convertAssetImage(named: "bannerImage")
        let posterULR = URL.convertAssetImage(named: "posterImage")
        
       return Film(id: "2baf70d1-42bb-4437-b551-e5fed5a87abe",
                   title: "Castle in the Sky",
                   description: "The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa. With the help of resourceful Pazu and a rollicking band of sky pirates, she makes her way to the ruins of the once-great civilization. Sheeta and Pazu must outwit the evil Muska, who plans to use Laputa's science to make himself ruler of the world.",
                   director: "Hayao Miyazaki",
                   producer: "Toru Hara",
                   releaseYear: "1988",
                   score: "93",
                   duration: "86",
                   image: posterULR?.absoluteString ?? "",
                   bannerImage: bannerULR?.absoluteString ?? "",
                   people: ["https://ghibliapi.vercel.app/people/598f7048-74ff-41e0-92ef-87dc1ad980a9"])
    }
    
    static var exampleFavorite: Film {
        //MockGhibliService().fetchFilm()
        let bannerULR = URL.convertAssetImage(named: "bannerImage")
        let posterULR = URL.convertAssetImage(named: "posterImage")
        
       return Film(id: "2baf70d1-42bb-4437-b551-e5fed5a87abe",
                   title: "Castle in the Sky",
                   description: "The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa. With the help of resourceful Pazu and a rollicking band of sky pirates, she makes her way to the ruins of the once-great civilization. Sheeta and Pazu must outwit the evil Muska, who plans to use Laputa's science to make himself ruler of the world.",
                   director: "Hayao Miyazaki",
                   producer: "Toru Hara",
                   releaseYear: "1988",
                   score: "93",
                   duration: "86",
                   image: posterULR?.absoluteString ?? "",
                   bannerImage: bannerULR?.absoluteString ?? "",
                   people: ["https://ghibliapi.vercel.app/people/598f7048-74ff-41e0-92ef-87dc1ad980a9"])
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
