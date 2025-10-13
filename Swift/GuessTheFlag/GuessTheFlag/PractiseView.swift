//
//  PractiseView.swift
//  GuessTheFlag
//
//  Created by seven on 2025/8/25.
//

import SwiftUI

struct PractiseView: View {
    @State private var countries: [CountryInfo] = Bundle.main.decode("countries_list.json")
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    
    @State private var score = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(stops: [
                    .init(color: .red, location: 0.3),
                    .init(color: .blue, location: 0.3)
                ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("Guess the flag")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                    
                    VStack(spacing: 15) {
                        VStack {
                            Text("Tap the correct flag")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.heavy)) // dynamic font, can be changed through user's setting
                            Text(countries[correctAnswer].en)
                                .font(.largeTitle.weight(.semibold))
                        }
                        
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                            } label: {
                                Image(countries[number].abb2)
                                    .clipShape(.capsule)
                                    .shadow(radius: 5)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                    
                    Spacer()
                    Spacer()
                    
                    Text("Score \(score)")
                        .font(.title)
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                    
                    Spacer()
                }
                .padding()
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("Continue") {
                    askQuestion()
                }
            } message: {
                Text("Your score is \(score)")
            }
        }
    }
    
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

#Preview {
    PractiseView()
}
