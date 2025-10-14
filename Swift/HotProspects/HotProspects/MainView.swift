//
//  MainView.swift
//  HotProspects
//
//  Created by seven on 2025/8/23.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Everyone", systemImage: "person.3", value: "One") {
                ProspectsView(filter: .none)
            }
            
            Tab("Contacted", systemImage: "checkmark.circle", value: "One") {
                ProspectsView(filter: .contacted)
            }
            
            Tab("Uncontacted", systemImage: "questionmark.diamond", value: "One") {
                ProspectsView(filter: .uncontacted)
            }
            
            Tab("Me", systemImage: "person.crop.square", value: "One") {
                MeView()
            }
        }
    }
}

#Preview {
    MainView()
}
