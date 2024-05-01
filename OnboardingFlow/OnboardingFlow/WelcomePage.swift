//
//  WelcomePage.swift
//  OnboardingFlow
//
//  Created by kkk on 2024/4/30.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 30)
                            .frame(width: 150, height: 150)
                            .foregroundStyle(.tint)
            Text("Welcome")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                .border(.red, width: 1)
            Text("Desc Text")
                .font(.title2)
                .fontWeight(.light)
                .border(.yellow, width: 2)
        }
        .border(.blue, width: 1)
        .padding()
        .border(.green, width: 1)
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}
