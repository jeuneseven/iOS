//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by seven on 2024/9/3.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["estonia", "france", "germany", "ireland", "italy", "nigeria", "poland", "spain", "uk", "us"].shuffled()
    let displayNames: [String: String] = [
        "uk": "UK",
        "us": "USA"
    ]
    @State private var showingScore = false
    @State private var scoreTitle = ""

    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack { // subheadline largeTitle is dynamic type
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(displayNames[countries[correctAnswer], default: countries[correctAnswer].capitalized])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            // flag was tapped
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
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
                
                Text("Score: ???")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
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
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
//    
//    @State private var showingAlert = false
//    var body: some View {
//        ZStack {
////            Text("Some content")
//            Color.red
//                .frame(width: 200, height: 200)
//            Text("Some content")
//        }
//        VStack { // spacer can fill the space in the gap
//            Spacer()
//            
//            Text("First")
//            Text("Second")
//            Text("Third")
//            
//            Spacer()
//            Spacer()
//        }
//        
//        ZStack {
//            Text("Some text")
//            Text("Water mark")
//        }
//        
//        VStack(alignment: .leading) {
//            Text("Hello World")
//            Text("This is another text view")
//        }
//        
//        HStack(spacing: 10) {
//            Text("Hello World")
//            Text("This is another text view")
//        }
//        
//        Button("Show Alert") {
//            showingAlert = true
//        }
//        .alert("Important message", isPresented: $showingAlert) {
//            Button("OK", role: .destructive) { }
//            Button("Cancel", role: .cancel) { }
//        } message: {
//            Text("Please read this.")
//        }
//        
//        VStack(spacing:10) {
//            Image(systemName: "pencil.circle").foregroundStyle(.red).font(.largeTitle)
//            
//            Button {
//                print("Edit button was tapped")
//            } label: { // default use Label rather than a HStack contains a image and a text
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
//        
//        if #available(iOS 16.0, *) {
//            Text("Your content")
//                .frame(maxWidth: 200, maxHeight: 200)
//                .foregroundStyle(.white)
//                .background(.red.gradient)
//        } else {
//            // Fallback on earlier versions
//        }
//        
//        AngularGradient(colors: [.red, .orange, .yellow, .green, .blue,.indigo, .purple], center: .center)
//            .ignoresSafeArea()
//
//        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
//            .ignoresSafeArea()
//
//        LinearGradient(stops: [
//            .init(color: .white, location: 0.45),
//            .init(color: .black, location: 0.55)
////            Gradient.Stop(color: .white, location: 0.45),
////            Gradient.Stop(color: .black, location: 0.55),
//        ], startPoint: .top, endPoint: .bottom)
//        .ignoresSafeArea()
//
//        LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
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
//    }
//    
//    func printSomething() {
//        print("Edit button was tapped")
//    }
}

#Preview {
    ContentView()
}
