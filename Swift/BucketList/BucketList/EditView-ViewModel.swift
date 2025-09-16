//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by seven on 2025/9/13.
//

import Foundation
import Observation

extension EditView {
    @Observable
    class ViewModel {
        enum LoadingState {
            case loading, loaded, failed
        }
        
        var name: String = ""
        var description: String = ""
        
        var loadState = LoadingState.loading
        var pages = [Page]()
        
        func fetchNearbyPlaces(location: Location) async {
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
            
            guard let url = URL(string: urlString) else { return }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let items = try JSONDecoder().decode(Result.self, from: data)
                pages = items.query.pages.values.sorted()
                loadState = .loaded
            } catch {
                print(error.localizedDescription)
                loadState = .failed
            }
        }
    }
}
