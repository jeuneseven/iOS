//
//  MissionModel.swift
//  Moonshot
//
//  Created by seven on 2025/8/29.
//

import Foundation

/**
 "id": 1,
 "crew": [
     {
         "name": "grissom",
         "role": "Command Pilot"
     },
     {
         "name": "white",
         "role": "Senior Pilot"
     },
     {
         "name": "chaffee",
         "role": "Pilot"
     }
 ],
 "description": "Apollo 1"
 */

struct MissionModel: Codable, Identifiable {
    struct Crew: Codable {
        var name: String
        var role: String
    }
    
    var id: Int
    var launchDate: Date?
    var crew: [Crew]
    
    var description: String
    
    var displayName: String {
        "Apolo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
