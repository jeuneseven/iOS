//
//  ResortView.swift
//  SnowSeeker
//
//  Created by seven on 2025/9/7.
//

import SwiftUI

struct ResortView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(Favorites.self) var favoirtes
    
    @State private var selectedFacility: Facility?
    @State private var isShownFacility = false
    
    let resort: Resort
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    if horizontalSizeClass == .compact && dynamicTypeSize > .large {
                        VStack(spacing: 10) {
                            ResortDetailView(resort: resort)
                        }
                        
                        VStack(spacing: 10) {
                            SkiDetailsView(resort: resort)
                        }
                    } else {
                        ResortDetailView(resort: resort)
                        SkiDetailsView(resort: resort)
                    }
                }
                .padding(.vertical)
                .background(.opacity(0.1))
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                
                Group {
                    Text(resort.description)
                        .padding(.vertical)
                    Text("Facilities")
                        .font(.headline)
                    HStack {
//                        Text(resort.facilities, format: .list(type:.and))
                        ForEach(resort.facilityTypes) { facility in
                            Button {
                                selectedFacility = facility
                                isShownFacility = true
                            } label: {
                                facility.icon
                                    .font(.title)
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
                
                Button(favoirtes.contains(resort) ? "Remove from favorites" : "Add to favorites") {
                    if favoirtes.contains(resort) {
                        favoirtes.remove(resort)
                    } else {
                        favoirtes.add(resort)
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
        .scrollBounceBehavior(.basedOnSize)
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(selectedFacility?.name ?? "More information", isPresented: $isShownFacility, presenting: selectedFacility) { _ in } message: { facility in
            Text(facility.description)
        }
    }
}

#Preview {
    ResortView(resort: .example)
        .environment(Favorites())
}
