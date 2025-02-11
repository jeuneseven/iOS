//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by seven on 2024/9/3.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var showingScore = false
    @State private var scoreTitle = ""

    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(.white)

                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                }
                
                ForEach(0..<3) { number in
                    Button {
                        // flag was tapped
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                    }
                }
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }
    
//    @State private var showingAlert = false
//    var body: some View {
//        Button("Show Alert") {
//            showingAlert = true
//        }
//        .alert("Important message", isPresented: $showingAlert) {
//            Button("Delete", role: .destructive) { }
//            Button("Cancel", role: .cancel) { }
//        } message: {
//            Text("Please read this.")
//        }
        
//        VStack(spacing:10) {
//            Button {
//                print("Edit button was tapped")
//            } label: {
//                Label("Edit", systemImage: "pencil")
//                    .padding()
//                    .foregroundStyle(.white)
//                    .background(.red)
//            }
//            
//            Button("Edit", systemImage: "pencil", action: printSomething)
//            
//            Button {
//                print("Edit button was tapped")
//            } label: {
//                Image(systemName: "pencil")
//            }
//            
//            Button {
//                print("Button was tapped")
//            } label: {
//                Text("Tap me!")
//                    .padding()
//                    .foregroundStyle(.white)
//                    .background(.red)
//            }
//            
//            Button("Button 1") { }
//                .buttonStyle(.bordered)
//            Button("Button 2", role: .destructive) { }
//                .buttonStyle(.bordered)
//            Button("Button 3") { }
//                .buttonStyle(.borderedProminent)
//                .tint(.mint)
//            Button("Button 4", role: .destructive) { }
//                .buttonStyle(.borderedProminent)
//        }
        
//        if #available(iOS 16.0, *) {
//            Text("Your content")
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .foregroundStyle(.white)
//                .background(.red.gradient)
//        } else {
//            // Fallback on earlier versions
//        }
//        
//        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
//        
//        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
//        
//        LinearGradient(stops: [
//            Gradient.Stop(color: .white, location: 0.45),
//            Gradient.Stop(color: .black, location: 0.55),
//        ], startPoint: .top, endPoint: .bottom)
//        
//        LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
//        
//        // use shift+command+a to toggle appearance
//        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//            // notice the difference between foregroundStyle and foregroundColor: foregroundStyle create vibrancy effect
//            Text("Your content")
//                .foregroundStyle(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()
    }
    
//    func printSomething() {
//        print("Edit button was tapped")
//    }
//}

#Preview {
    ContentView()
}
