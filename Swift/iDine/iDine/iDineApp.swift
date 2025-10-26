//
//  iDineApp.swift
//  iDine
//
//  Created by seven on 2025/8/12.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
