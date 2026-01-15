//
//  CodeBreakerView.swift
//  CodeBreaker
//
//  Created by seven on 2025/12/26.
//

import SwiftUI

struct CodeBreakerView: View {
    @State var game = CodeBreaker()
    var body: some View {
        VStack {
            ForEach(game.attempts.indices, id:\.self) { index in
                view(for: game.attempts[index])
            }
        }
        .padding()
    }
    
    func view(for code: Code) -> some View {
        HStack {
            ForEach(code.pegs.indices, id:\.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(code.pegs[index])
                    .onTapGesture {
                        if code.kind == .guess {
                            game.changeGuessPeg(at: index)
                        }
                    }
            }
            
            MatchMarkers(matchs: [])
        }
    }
}

#Preview {
    CodeBreakerView()
}
