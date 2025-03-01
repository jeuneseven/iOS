//
//  ContentView.swift
//  BetterRest
//
//  Created by seven on 2025/2/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Text(Date.now.formatted(date: .long, time: .omitted))
    }
    
//    func trivialExample() {
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? .now
//
//        let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
//    }

    
//    @State private var wakeUp = Date.now
//
//    var body: some View {
//        DatePicker("Please enter a date", selection: $wakeUp)
//        
//        DatePicker("", selection: $wakeUp)
//
//        DatePicker("Please enter a date", selection: $wakeUp)
//            .labelsHidden()
//        
//        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .date)
//        
//        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
//        
//        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
//    }
//    
//    func exampleDates() {
//        // create a second Date instance set to one day in seconds from now
//        let tomorrow = Date.now.addingTimeInterval(86400)
//
//        // create a range from those two
//        let range = Date.now...tomorrow
//    }
    
//    @State private var sleepAmount = 8.0
//
//    var body: some View {
//        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
//    }
}

#Preview {
    ContentView()
}
