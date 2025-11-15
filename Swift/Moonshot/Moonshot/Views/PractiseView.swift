//
//  PractiseView.swift
//  WeSplit
//
//  Created by seven on 2025/8/25.
//

import SwiftUI

struct PractiseView: View {
    let missions: [MissionModel] = Bundle.main.decoder("missions.json")
    let astronauts: [String: AstronautModel] = Bundle.main.decoder("astronauts.json")
    
    let columnsLayout = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: columnsLayout) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionDetailView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedDate)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightColorTheme)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightColorTheme)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkColorTheme)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    PractiseView()
}
