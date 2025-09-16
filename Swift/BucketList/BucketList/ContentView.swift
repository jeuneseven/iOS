//
//  ContentView.swift
//  BucketList
//
//  Created by seven on 2025/8/20.
//

import SwiftUI
import MapKit
import LocalAuthentication

struct ContentView: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2DMake(56, -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(viewModel.locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(.circle)
                            .onLongPressGesture {
                                viewModel.selectedPlace = location
                            }
                    }
                }
            }
            .mapStyle(.standard)
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local) {
//                        print("Tapped at \(position)")
                    viewModel.addLocation(at: coordinate)
                }
            }
            .sheet(item: $viewModel.selectedPlace) { place in
//                    Text(place.name)
                EditView(location: place) {
                    viewModel.updateLocation(location: $0)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
