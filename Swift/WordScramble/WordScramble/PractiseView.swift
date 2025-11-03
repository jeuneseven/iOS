//
//  PractiseView.swift
//  GuessTheFlag
//
//  Created by seven on 2025/8/25.
//

import SwiftUI

struct PractiseView: View {
    @State private var viewModel = ViewModel()
    
    @FocusState private var isShowingKeyboard: Bool
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Please enter new word", text: $viewModel.newWord)
                        .textInputAutocapitalization(.never)
                        .focused($isShowingKeyboard)
                }
                
                Section {
                    ForEach(viewModel.usedWords, id: \.self) {
                        Label($0, systemImage: "\($0.count).circle")
                    }
                }
            }
            .navigationTitle(viewModel.rootWord)
            .onSubmit(viewModel.addNewWord)
            .onAppear(perform: viewModel.startGame)
            .alert(viewModel.alertTitle, isPresented: $viewModel.showingAlert) {
                Button("OK") {}
            } message: {
                Text(viewModel.alertContent)
            }
            .toolbar {
                Button("Done") {
                    if isShowingKeyboard {
                        isShowingKeyboard = false
                    }
                }
            }
        }
    }
}

#Preview {
    PractiseView()
}
