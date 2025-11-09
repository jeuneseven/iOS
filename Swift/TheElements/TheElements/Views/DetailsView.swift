//
//  DetailsView.swift
//  TheElements
//
//  Created by seven on 2025/9/10.
//

import SwiftUI

struct DetailsView: View {
    var element: ElementModel
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("\(element.atomicNumber)")
                        .font(.title)
                    Spacer()
                    Text(element.symbol)
                        .font(.title)
                }
                
                VStack {
                    Text(element.name)
                        .font(.largeTitle)
                    
                    Text("Atomic Weight: \(element.atomicWeight)")
                        .font(.title)
                    
                    Text("State: \(element.state)")
                        .font(.title)
                    
                    Text("Period: \(element.period)")
                        .font(.title)
                    
                    Text("Group: \(element.group)")
                        .font(.title)
                    
                    Text("Discoverd: \(element.discoveryYear)")
                        .font(.title)
                    
                    NavigationLink {
                        
                    } label:{
                        Text("View at Wikipedia")
                    }
                }
            }
            .background(.gray)
            .padding(.horizontal, 80)
            .foregroundStyle(.white)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "square.grid.2x2", action: {})
                }
            }
        }
    }
}

#Preview {
    let elementsList: [ElementModel] = Bundle.main.decode("Elements.plist")
    return DetailsView(element: elementsList[0])
}
