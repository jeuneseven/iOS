//
//  AddressDetailView.swift
//  CupcakeCorner
//
//  Created by seven on 2025/8/30.
//

import SwiftUI

private let title = "Delivery details"

struct AddressDetailView: View {
    // @Bindable create missing binding for @Observable without @state to create local data
    @Bindable var order: OrderModel
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                
                TextField("Street address", text: $order.streetAddress)
                
                TextField("City", text: $order.city)
                
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink("Check out") {
                    CheckoutDetailView(order: order)
                }
            }
            .disabled(order.hasValidAddress)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressDetailView(order: OrderModel())
}
