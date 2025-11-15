//
//  MissionDetailView.swift
//  Moonshot
//
//  Created by seven on 2025/8/29.
//

import SwiftUI

struct MissionDetailView: View {
    struct CrewRoleMember {
        var role: String
        var astronaut: AstronautModel
    }
    let mission: MissionModel
    let crew: [CrewRoleMember]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                
                
                VStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightColorTheme)
                        .padding(.vertical)
                    
                    Text("Mission Highlight")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                        .font(.subheadline)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightColorTheme)
                        .padding(.vertical)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(crew, id:\.role) { crewMember in
                            NavigationLink {
                                AstronautDetailView(astronaut: crewMember.astronaut)
                            } label: {
                                HStack {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 104, height: 72)
                                        .clipShape(.capsule)
                                        .overlay {
                                            Capsule()
                                                .strokeBorder(.white, lineWidth: 1)
                                        }
                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                        Text(crewMember.role)
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkColorTheme)
    }
    
    init(mission: MissionModel, astronauts: [String: AstronautModel]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewRoleMember(role: member.role, astronaut: astronaut)
            }
            
            fatalError("Missing \(member.name)")
        }
    }
}

#Preview {
    let missions: [MissionModel] = Bundle.main.decoder("missions.json")
    let astronauts: [String: AstronautModel] = Bundle.main.decoder("astronauts.json")
    return MissionDetailView(mission: missions[0], astronauts: astronauts).preferredColorScheme(.dark)
}
