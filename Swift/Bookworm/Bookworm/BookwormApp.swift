//
//  BookwormApp.swift
//  Bookworm
//
//  Created by seven on 2025/8/19.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: [Book.self, StudentModel.self, BookModel.self])
    }
}
