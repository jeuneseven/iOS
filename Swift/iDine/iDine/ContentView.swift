//
//  ContentView.swift
//  iDine
//
//  Created by seven on 2025/8/12.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            // first way to navigation
                            NavigationLink(value: item) {
                                ItemRow(item: item)
                            }
                            // another way to navigation
//                            NavigationLink {
//                                ItemDetail(item: item)
//                            } label: {
//                                ItemRow(item: item)
//                            }
                        }
                    }
                }
            }
            .navigationDestination(for: MenuItem.self, destination: { item in
                ItemDetail(item: item)
            })
            .navigationTitle("Menu")
            .listStyle(.plain)
        }
    }
}

#Preview {
    ContentView()
}
