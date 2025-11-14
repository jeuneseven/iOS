//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by seven on 2025/8/20.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: [User.self, UserModel.self])
    }
}
