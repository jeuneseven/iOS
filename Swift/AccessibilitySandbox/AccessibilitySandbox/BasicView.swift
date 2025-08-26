//
//  BasicView.swift
//  AccessibilitySandbox
//
//  Created by seven on 2025/8/23.
//

import SwiftUI

struct BasicView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    @State private var value = 10
    
    var body: some View {
        Button("Tap") {
            print("Button tapped")
        }
        .accessibilityInputLabels(["A", "B", "C"])
        
//        VStack {
//            Text("Value: \(value)")
//            
//            Button("Increment") {
//                value += 1
//            }
//            
//            Button("Decrement") {
//                value -= 1
//            }
//        }
//        .accessibilityElement()
//        .accessibilityLabel("Value")
//        .accessibilityValue(String(value))
//        .accessibilityAdjustableAction { direction in
//            switch direction {
//            case .increment:
//                value += 1
//            case .decrement:
//                value -= 1
//            default:
//                print("Not handled")
//            }
//        }
        
//        VStack {
//            Text("Your score is")
//            
//            Text("100")
//                .font(.title)
//        }
//        .accessibilityElement(children: .ignore) // ignore is default
//        .accessibilityLabel("Your score is 100")
        
        // decorative will be avoid to read in voiceover
//        Image(decorative: "character")
        
//        Image(.character)
//            .accessibilityHidden(true)
        
//        Button {
//            selectedPicture = Int.random(in: 0...3)
//        } label: {
//            Image(pictures[selectedPicture])
//                .resizable()
//                .scaledToFit()
//                .accessibilityLabel(labels[selectedPicture])
////                .accessibilityAddTraits(.isButton)
////                .accessibilityRemoveTraits(.isImage)
//        }
    }
}

#Preview {
    BasicView()
}
