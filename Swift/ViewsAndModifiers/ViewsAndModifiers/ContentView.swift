//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by seven on 2024/10/13.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
        
//        Button("Hello, world!") {
//            // AnyView
//            print(type(of: self.body))
//        }
//        // view modifier's order matters
//        .frame(width: 200, height: 200)
//        .background(.red)
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.red)
//        // there is an UIHostingController behind the view, it's belong to UIKit
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//        .background(.red)
    }
}

#Preview {
    ContentView()
}
