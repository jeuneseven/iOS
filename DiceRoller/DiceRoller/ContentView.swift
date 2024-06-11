//
//  ContentView.swift
//  DiceRoller
//
//  Created by seven on 2024/5/11.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfDice:Int = 3
    
    var body: some View {
        VStack() {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
            HStack() {
                ForEach(1...numberOfDice, id: \.description) {_ in
                    DiceView()
                }
            }
            
            HStack {
                Button("Remove Dice") {
                    numberOfDice -= 1
                }
                .disabled(numberOfDice == 1)
                
                Button("Add Dice", systemImage: "plus.circle.fill") {
                    numberOfDice += 1
                }
                .disabled(numberOfDice == 5)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
