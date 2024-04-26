//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Kai on 2024/4/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Monday")
                Image(systemName: "sun.max.fill")
                    .foregroundColor(Color.yellow)
                Text("High: 30")
                Text("Low: 15")
            }.padding()
            VStack {
                Text("Tuesday")
                Image(systemName: "cloud.rain.fill")
                    .foregroundColor(Color.blue)
                Text("High: 20")
                Text("Low: 11")
            }.padding()
        }
//        VStack {
//            Text("Knock, knock!")
//                .padding()
//                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))
//                .shadow(radius: 4)
//            Text("Who's there?")
//                .padding()
//                .background(Color.teal, in: RoundedRectangle(cornerRadius: 8))
//        }
//        .padding()
//        HStack {
//            Text("Knock, knock!")
//                .padding()
//                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))
//                .shadow(radius: 4)
//            Text("Who's there?")
//                .padding()
//                .background(Color.teal, in: RoundedRectangle(cornerRadius: 8))
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
