//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by seven on 2024/10/13.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var motto1: some View {
        Text("Draco dormiens")
    }
    
    let motto2 = Text("nunquam titillandus")

    var spells: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    @ViewBuilder var anotherSpells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
        }
        
        spells
        
        anotherSpells
        
//        VStack {
//            Text("Gryffindor")
//                .blur(radius: 0) // That won’t work the same way: blur() is a regular modifier, so any blurs applied to child views are added to the VStack blur rather than replacing it.
//            
//            Text("Hufflepuff")
//            Text("Ravenclaw")
//            Text("Slytherin")
//        }
//        .blur(radius: 5)
//        .font(.title)
        
//        if useRedText {
//            Button("Hello World") {
//                useRedText.toggle()
//            }
//            .foregroundStyle(.red)
//        } else {
//            Button("Hello World") {
//                useRedText.toggle()
//            }
//            .foregroundStyle(.blue)
//        }
        
//        Text("Hello, world!")
//            .padding()
//            .background(.red)
//            .padding()
//            .background(.blue)
//            .padding()
//            .background(.green)
//            .padding()
//            .background(.yellow)
        
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
