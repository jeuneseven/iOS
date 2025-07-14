//
//  ContentView.swift
//  BetterRest
//
//  Created by seven on 2025/2/20.
//

import CoreML
import SwiftUI

struct ContentView: View {
//    @State private var wakeUp = defaultWakeTime
//    @State private var sleepAmount = 8.0
//    @State private var coffeeAmount = 1
//    
//    @State private var alertTitle = ""
//    @State private var alertMessage = ""
//    @State private var showingAlert = false
//    
//    static var defaultWakeTime: Date {
//        var components = DateComponents()
//            components.hour = 7
//            components.minute = 0
//        return Calendar.current.date(from: components) ?? .now
//    }
//    
//    var body: some View {
//        NavigationStack {
//            Form {
//                VStack(alignment: .leading, spacing: 0) {
//                    Text("When do you want to wake up?")
//                        .font(.headline)
//                    
//                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
//                        .labelsHidden()
//                }
//
//                VStack(alignment: .leading, spacing: 0) {
//                    Text("Desired amount of sleep")
//                        .font(.headline)
//                    
//                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
//                }
//                
//                VStack(alignment: .leading, spacing: 0) {
//                    Text("Daily coffee intake")
//                        .font(.headline)
//                    
//                    Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
//                }
//            }
//            .navigationTitle("BetterRest")
//            .toolbar {
//                Button("Calculate", action: calculateBedtime)
//            }
//            .alert(alertTitle, isPresented: $showingAlert) {
//                Button("OK") { }
//            } message: {
//                Text(alertMessage)
//            }
//        }
//    }
    
//    func calculateBedtime() {
//        do {
//            let config = MLModelConfiguration()
//            let model = try BetterRestML(configuration: config)
//            
//            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
//            let hour = (components.hour ?? 0) * 60 * 60
//            let minute = (components.minute ?? 0) * 60
//            
//            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
//
//            let sleepTime = wakeUp - prediction.actualSleep
//            alertTitle = "Your ideal bedtime is…"
//            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
//            
//        } catch {
//            // something went wrong!
//            alertTitle = "Error"
//            alertMessage = "Sorry, there was a problem calculating your bedtime."
//        }
//        
//        showingAlert = true
//    }
    
    var body: some View {
        Text(Date.now.formatted(date: .long, time: .shortened))
        
        Text(Date.now, format: .dateTime.day().month().year().hour().minute())
    }
    
    func trivialExample() {
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? .now

        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }

//    @State private var wakeUp = Date.now
//
//    var body: some View {
//        DatePicker("Please enter a date", selection: $wakeUp)
//        // Please enter a date still occupy the place
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
//        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: sleepAmount >= 10 ? 0.5 : 0.25)
//    }
}

#Preview {
    ContentView()
}
