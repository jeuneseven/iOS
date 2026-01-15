//
//  ContentView.swift
//  CodeBreaker
//
//  Created by seven on 2025/12/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            pegs(colors: [.red, .yellow, .blue, .green])
        }
        .padding()
    }
    
    func pegs(colors: Array<Color>) -> some View {
        HStack {
            ForEach(colors.indices, id:\.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(colors[index])
            }
            
            MatchMarkers(matchs: [])
        }
    }
}

#Preview {
    ContentView()
}
