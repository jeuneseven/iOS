//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Kai on 2024/4/19.
//

import SwiftUI

struct DayForecast: View {
    let day: String
    let isRain:Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRain {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRain {
            return Color.blue
        } else {
            return Color.yellow
        }
    }
    
    var body: some View {
        VStack {
            Text(day).font(Font.headline)
            Image(systemName: iconName)
                .foregroundColor(iconColor).padding(2)
            Text("High: \(high)").fontWeight(Font.Weight.bold)
            Text("Low: \(low)").fontWeight(Font.Weight.medium).foregroundStyle(Color.secondary)
        }.padding()
    }
}

struct ContentView: View {
    var body: some View {
        HStack {
            DayForecast(day: "Monday", isRain: false, high: 30, low: 15)
            DayForecast(day: "Tuesday", isRain: true, high: 20, low: 10)
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
