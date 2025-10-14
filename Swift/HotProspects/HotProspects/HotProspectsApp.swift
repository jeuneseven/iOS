//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by seven on 2025/8/20.
//

import SwiftUI
import SwiftData

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: Prospect.self)
    }
}
