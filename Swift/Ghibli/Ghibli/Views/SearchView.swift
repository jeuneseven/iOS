//
//  SearchView.swift
//  Ghibli
//
//  Created by seven on 2025/12/22.
//

import SwiftUI

struct SearchView: View {
    @State private var text = ""
    
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .searchable(text: $text)
        }
    }
}

#Preview {
    SearchView()
}
