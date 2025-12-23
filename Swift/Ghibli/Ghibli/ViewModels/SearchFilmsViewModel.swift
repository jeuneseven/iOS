//
//  SearchFilmsViewModel.swift
//  Ghibli
//
//  Created by seven on 2025/12/23.
//

import Foundation
import Observation

@Observable
class SearchFilmsViewModel {
    var state: LoadingState<[Film]> = .idle
    
    private let service: GhibliService
    
    init(service: GhibliService = DefaultGhibliService()) {
        self.service = service
    }

    func fetch(for searchTerm: String) async {
        try? await Task.sleep(for: .milliseconds(500))
        guard !Task.isCancelled else { return }
        
        guard !searchTerm.isEmpty else { return }
        state = .loading
        do {
            let films = try await service.searchFilm(for: searchTerm)
            self.state = .loaded(films)
        } catch let error as APIError {
            self.state = .error(error.errorDescription ?? "unknown error")
        } catch {
            self.state = .error("unknown error")
        }
    }
}
