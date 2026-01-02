//
//  ContentView.swift
//  ShakeStat
//
//  Created by seven on 2026/1/1.
//

import SwiftUI

struct ContentView: View {
    @State private var playData = PlayData()
    @State private var searchText = ""
    var filterData:[String] {
        if searchText.isEmpty {
            playData.filteredWords
        } else {
            playData.filteredWords.filter { option in
                option.localizedStandardContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filterData, id: \.self) { word in
                    HStack {
                        Text(word)
                            .font(.title2)
                        
                        Spacer()
                        
                        Text("\(playData.wordCounts.count(for: word))")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("ShakeStat")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    ContentView()
}
