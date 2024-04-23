//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Kai on 2024/4/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
            Text("Hello, world!")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
