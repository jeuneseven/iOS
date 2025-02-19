//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by seven on 2024/10/13.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content

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

//struct Watermark: ViewModifier {
//    var text: String
//
//    func body(content: Content) -> some View {
//        ZStack(alignment: .bottomTrailing) {
//            content
//            Text(text)
//                .font(.caption)
//                .foregroundStyle(.white)
//                .padding(5)
//                .background(.black)
//        }
//    }
//}
//
//extension View {
//    func watermarked(with text: String) -> some View {
//        modifier(Watermark(text: text))
//    }
//}

//struct Title: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .font(.largeTitle)
//            .foregroundStyle(.white)
//            .padding()
//            .background(.blue)
//            .clipShape(.rect(cornerRadius: 10))
//    }
//}
//
//extension View {
//    func titleStyle() -> some View {
//        modifier(Title())
//    }
//}

//struct CapsuleText: View {
//    var text: String
//
//    var body: some View {
//        Text(text)
//            .font(.largeTitle)
//            .padding()
//            .foregroundStyle(.white)
//            .background(.blue)
//            .clipShape(.capsule)
//    }
//}

struct ContentView: View {
//    @State private var useRedText = false
//    
//    var motto1: some View {
//        Text("Draco dormiens")
//    }
//    
//    let motto2 = Text("nunquam titillandus")
//
//    var spells: some View {
//        Group {
//            Text("Lumos")
//            Text("Obliviate")
//        }
//    }
//    
//    @ViewBuilder var anotherSpells: some View {
//        Text("Lumos")
//        Text("Obliviate")
//    }
    
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
        
//        Color.blue
//            .frame(width: 300, height: 200)
//            .watermarked(with: "Hacking with Swift")
        
//        Text("Hello World")
//            .titleStyle()
        
//        VStack(spacing: 10) {
//            CapsuleText(text: "First")
//            CapsuleText(text: "Second")
//        }
        
//        VStack {
//            motto1
//                .foregroundStyle(.red)
//            motto2
//                .foregroundStyle(.blue)
//        }
//        HStack {
//            spells
//        }
//        ZStack {
//            anotherSpells
//        }
        
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
