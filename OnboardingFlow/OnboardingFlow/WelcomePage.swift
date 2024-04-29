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
            Text("Welcome")
                .font(.title)
                .fontWeight(.semibold)
            Text("Desc Text")
                .font(.title2)
                .fontWeight(.light)
        }.padding()
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}
