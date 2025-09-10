//
//  RateView.swift
//  Bookworm
//
//  Created by seven on 2025/8/31.
//

import SwiftUI

struct RateView: View {
    @Binding var rating: Int
    
    var label = ""
    var maxRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maxRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }

            }
        }
        .buttonStyle(.plain) // form let user can tap whole row, this will treat each button individual
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RateView(rating: .constant(1))
}
