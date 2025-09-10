//
//  EmojiRateView.swift
//  Bookworm
//
//  Created by seven on 2025/8/31.
//

import SwiftUI

struct EmojiRateView: View {
    let rating: Int
    var body: some View {
        switch rating {
        case 1:
            Text("😴")
        case 2:
            Text("😩")
        case 3:
            Text("🙂")
        case 4:
            Text("😊")
        case 5:
            Text("😁")
        default:
            Text("🙂")
        }
    }
}

#Preview {
    EmojiRateView(rating: 4)
}
