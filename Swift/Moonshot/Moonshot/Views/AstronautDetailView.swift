//
//  AstronautDetailView.swift
//  Moonshot
//
//  Created by seven on 2025/8/29.
//

import SwiftUI

struct AstronautDetailView: View {
    let astronaut: AstronautModel
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkColorTheme)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: AstronautModel] = Bundle.main.decoder("astronauts.json")
    let astronaut = astronauts["white"]!
    return AstronautDetailView(astronaut: astronaut)
        .preferredColorScheme(.dark)
}
