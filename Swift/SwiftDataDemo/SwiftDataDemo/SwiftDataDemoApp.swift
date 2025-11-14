//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo
//
//  Created by seven on 2025/8/31.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: Student.self)
    }
}
