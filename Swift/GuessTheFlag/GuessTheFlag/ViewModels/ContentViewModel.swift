//
//  ContentViewModel.swift
//  GuessTheFlag
//
//  Created by seven on 2025/9/8.
//

import Foundation
import SwiftUI
import Observation

extension ContentView {
    @Observable
    class ViewModel {
        var countries:[CountryInfo] = Bundle.main.decode("countries_list.json")
        var correctAnswer = Int.random(in: 0...2)
        
        var showingAlert = false
        var alertTitle = ""
        
        var score = 0
        
        var countryName: String {
            countries[correctAnswer].en
        }
        
        let labels = [
            "Estonia" : "descriptrion",
            "France" : "descriptrion",
            "Germany" : "descriptrion",
            "Ireland" : "descriptrion",
            "Italy" : "descriptrion",
            "Nigeria" : "descriptrion",
            "Poland" : "descriptrion",
            "Spain" : "descriptrion",
            "UK" : "descriptrion",
            "US" : "descriptrion"
        ]
        
        func flagTapped(_ number: Int) {
            if number == correctAnswer {
                alertTitle = "Correct"
                score += 1
            } else {
                alertTitle = "Wrong"
                score -= 1
            }
            
            showingAlert = true
        }
        
        func askQuestion() {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    }
}
