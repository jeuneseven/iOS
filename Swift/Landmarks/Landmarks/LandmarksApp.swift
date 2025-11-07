//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by seven on 2025/9/6.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            LandmarkList()
                .environment(modelData)
        }
    }
}
