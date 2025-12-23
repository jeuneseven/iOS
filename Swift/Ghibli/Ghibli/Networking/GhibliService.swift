//
//  GhibliService.swift
//  Ghibli
//
//  Created by seven on 2025/11/3.
//

import Foundation

protocol GhibliService: Sendable {
    func fetchFilms() async throws -> [Film]
    func fetchPerson(from URLString: String) async throws -> Person
    
    func searchFilm(for searchTerm: String) async throws -> [Film]
}
