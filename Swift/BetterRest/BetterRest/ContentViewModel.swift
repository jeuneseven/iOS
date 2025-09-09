//
//  ContentViewModel.swift
//  BetterRest
//
//  Created by seven on 2025/9/9.
//

import CoreML
import Foundation
import Observation

@Observable
class ContentViewModel {
    var wakeUp = defaultWakeTime
    var sleepAmount = 8.0
    var coffeeAmount = 1
    
    var alertTitle = ""
    var alertMessage = ""
    var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
            components.hour = 7
            components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            // SleepCalculator is auto generated
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            // something went wrong!
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            print(error.localizedDescription)
        }
        
        showingAlert = true
    }
}
