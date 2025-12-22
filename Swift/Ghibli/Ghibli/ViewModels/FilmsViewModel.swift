//
//  FilmsViewModel.swift
//  Ghibli
//
//  Created by seven on 2025/11/3.
//

import Foundation
import Observation

@Observable
class FilmsViewModel {
    enum State: Equatable {
        case idle
        case loading
        case loaded([Film])
        case error(String)
    }
    
    var state: State = .idle
    
    private let service: GhibliService
    
    init(service: GhibliService = DefaultGhibliService()) {
        self.service = service
    }

    func fetch() async {
        // avoid to fetct too many times
        guard state == .idle else { return }
        state = .loading
        do {
            let films = try await service.fetchFilms()
            self.state = .loaded(films)
        } catch let error as APIError {
            self.state = .error(error.errorDescription ?? "unknown error")
        } catch {
            self.state = .error("unknown error")
        }
    }
    
    static var example: FilmsViewModel {
        let vm = FilmsViewModel(service: MockGhibliService())
        vm.state = .loaded([Film.example, Film.exampleFavorite])
        return vm
    }
}
