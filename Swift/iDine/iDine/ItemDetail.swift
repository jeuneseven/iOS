//
//  ItemDetail.swift
//  iDine
//
//  Created by seven on 2025/8/20.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(item.mainImage)
                        .resizable()
                        .scaledToFit()
                    
                    Text("Photo: \(item.photoCredit)")
                        .padding(4)
                        .background(.black)
                        .font(.caption)
                        .foregroundStyle(.white)
                        .offset(x: -5, y: -5)
                }
                
                Text(item.description)
                    .padding()
                
                Button("Order This") {
                    order.add(item: item)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    NavigationStack {
        ItemDetail(item: MenuItem.example)
            .environmentObject(Order())
    }
}
