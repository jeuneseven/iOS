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
        Text("Hello World!")
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(
            iconName: "person.2.crop.square.stack.fill",
            description: "A multiline description about a feature paired with the image on the left.")
    }
}
