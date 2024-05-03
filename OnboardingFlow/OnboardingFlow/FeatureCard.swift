//
//  FeatureCard.swift
//  OnboardingFlow
//
//  Created by kkk on 2024/5/2.
//

import SwiftUI

struct FeatureCard: View {
    let iconName:String
    let description: String
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50)
                .padding(.trailing, 10)
            Text(description)
            Spacer()
        }
        .padding()
        .background(.tint, in: RoundedRectangle(cornerRadius: 10))
        .foregroundStyle(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(
            iconName: "person.fill",
            description: "A multiline description about a feature paired with the image on the left.")
    }
}
