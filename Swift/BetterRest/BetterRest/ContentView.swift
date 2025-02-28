//
//  ContentView.swift
//  BetterRest
//
//  Created by seven on 2025/2/20.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now

    var body: some View {
//        DatePicker("Please enter a date", selection: $wakeUp)
//        
//        DatePicker("", selection: $wakeUp)
//
//        DatePicker("Please enter a date", selection: $wakeUp)
//            .labelsHidden()
//        
//        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
        
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
    }
    
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
