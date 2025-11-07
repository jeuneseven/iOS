//
//  MapView.swift
//  Landmarks
//
//  Created by seven on 2025/9/6.
//

import SwiftUI
import MapKit

struct MapView: View {
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
    
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        Map(position: .constant(.region(region)))
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
