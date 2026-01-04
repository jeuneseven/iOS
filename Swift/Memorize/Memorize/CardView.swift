//
//  CardView.swift
//  Memorize
//
//  Created by seven on 2026/1/4.
//

import SwiftUI

struct CardView: View {
    @State var isFacedUp = false
    var content = "😈"
    
    let base = RoundedRectangle(cornerRadius: 12)
    
    var body: some View {
        ZStack {
            Group {
                base
                    .foregroundStyle(.white)
                base
                    .stroke(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFacedUp ? 1 : 0)
            base.fill().opacity(isFacedUp ? 0: 1)
        }
        .onTapGesture {
            isFacedUp.toggle()
        }
    }
}

#Preview {
    CardView()
}
