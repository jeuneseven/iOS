//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by seven on 2024/10/13.
//

import SwiftUI

// Content is the parameter which gridstack accept
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content // use @ViewBuilder can ignore HStack in line 106

    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct Watermark: ViewModifier {
    var text: String // custom view modifier can has their own property

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct ContentView: View {
    @State private var useRedText = false
    @State private var useBlackText = false

    // computed property
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
    
    var body: some View { // can be a specific view e.g Text, but can not a View e.g var body: View
        
        GridStack(rows: 4, columns: 4) { row, col in
            HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
        
        Color.blue
            .frame(width: 300, height: 200)
            .watermarked(with: "Swift")
        
        // custom modifier
        Text("Hello World")
            .titleStyle()
        
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .blur(radius: 2)
            CapsuleText(text: "Second")
        }
        
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
        }
        HStack {
            spells
        }
        ZStack {
            anotherSpells
        }
        
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
//        
//        VStack {
//            Text("Gryffindor")
//                .font(.largeTitle) // will overwrite the VStack.font which is an envirement modifer
//            
//            Text("Hufflepuff")
//            Text("Ravenclaw")
//            Text("Slytherin")
//        }
//        .font(.title)
//
//        // need to destroy different view
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
//        // perfer use this
//        Button("Hello World!") {
//            useBlackText.toggle()
//        }
//        .foregroundStyle(useBlackText ? .black : .gray)
//        // render padding and background color times can be overlay
//        Text("Hello, world!")
//            .padding()
//            .background(.red)
//            .padding()
//            .background(.blue)
//            .padding()
//            .background(.green)
//            .padding()
//            .background(.yellow)
//        
//        Button("Hello, world!") {
//            // AnyView
//            print(type(of: self.body))
//        }
//        // view modifier's order matters
//        .frame(width: 200, height: 200)
//        .background(.red)
//      .frame(width: 200, height: 200)
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.red)
//        // there is an UIHostingController behind the view, it's belong to UIKit, it is the bridge of UIKit and SwiftUI framework
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
