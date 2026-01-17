//
//  CodeBreakerView.swift
//  CodeBreaker
//
//  Created by seven on 2025/12/26.
//

import SwiftUI

struct CodeBreakerView: View {
    // MARK: Data In
//    @Environment(\.sceneFrame) var sceneFrame
    
    // MARK: Data owned by CodeBreakerView
    @State private var game = CodeBreaker(pegChoices:[.red, .yellow, .blue, .green])
    @State private var selection: Int = 0
    @State private var restarting = false
    @State private var hideMostRecentMarkers = false
    
    // MARK: body
    var body: some View {
        
        VStack {
            CodeView(code: game.masterCode) {
                ElapsedTime(startTime: game.startTime, endTime: game.endTime, elapsedTime: game.elapsedTime)
            }
            
            ScrollView {
                if !game.isOver {
                    CodeView(code: game.guess, selection: $selection) {
                        Button("Guess", action: guess)
                            .flexibleSystemFont()
                    }
                    .animation(nil, value: game.attempts.count)
                    .opacity(restarting ? 0 : 1)
                }
                ForEach(game.attempts.indices.reversed(), id:\.self) { index in
                    CodeView(code: game.attempts[index]) {
                        let showMarkers = !hideMostRecentMarkers || index != game.attempts.count - 1
                        if showMarkers, let matches = game.attempts[index].matches {
                            MatchMarkers(matches: matches)
                        }
                    }
                    .transition(.attempt(game.isOver))
                }
            }
            
//            GeometryReader { geometry in
                if !game.isOver {
                    let offset = 200//sceneFrame.maxY - geometry.frame(in: .global).minY
                    PegChooser(choices: game.pegChoices, onChoose: changePegAtSelection)
                        .transition(.pegChooser)
                }
//            }
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Restart", systemImage: "arrow.circlepath", action: restart)
            }
        }
    }
    
    func guess() {
        withAnimation() {
            game.attemptGuess()
            selection = 0
            hideMostRecentMarkers = true
        } completion: {
            withAnimation(.guess) {
                hideMostRecentMarkers = false
            }
        }
    }
    
    func changePegAtSelection(to peg: Peg) {
        game.setGuessPeg(peg, at: selection)
        selection = (selection + 1) % game.masterCode.pegs.count
    }
    
    func restart() {
        withAnimation(.restart) {
            restarting = game.isOver
            game.restart()
            selection = 0
        } completion: {
            withAnimation(.restart) {
                restarting = false
            }
        }
    }
    
    struct GuessButton {
        static let minimumFontSize: CGFloat = 8
        static let maximumFontSize: CGFloat = 80
        static let scaleFactor = minimumFontSize / maximumFontSize
    }
}

#Preview {
    CodeBreakerView()
}
