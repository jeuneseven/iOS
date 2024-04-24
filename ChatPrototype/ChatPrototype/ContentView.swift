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
            Text("Knock, knock!")
                            .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))
                            .padding()
                        Text("Who's there?")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
