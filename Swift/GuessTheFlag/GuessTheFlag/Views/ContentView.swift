//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by seven on 2024/9/3.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            
            VStack {
                Spacer()
                
                Text(Constants.Strings.title)
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                VStack(spacing: Constants.Design.space) {
                    VStack { // subheadline largeTitle is dynamic type
                        Text(Constants.Strings.subTitle)
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(viewModel.countryName)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            // flag was tapped
                            viewModel.flagTapped(number)
                        } label: {
                            Image(viewModel.countries[number].abb2)
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
//                        .accessibilityLabel(viewModel.labels[viewModel.countries[number] , default:"Unknown flag"])
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                
                Text("Score: \(viewModel.score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(viewModel.alertTitle, isPresented: $viewModel.showingAlert) {
            Button(Constants.Strings.alertButton, action: viewModel.askQuestion)
        } message: {
            Text("Your score is \(viewModel.score)")
        }
    }
}

#Preview {
    ContentView()
}
