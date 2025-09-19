//
//  PractiseView.swift
//  WeSplit
//
//  Created by seven on 2025/8/25.
//

import SwiftUI

private let title = "CupCake Corner"

struct PractiseView: View {
    @State private var order = OrderModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type:", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special request?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extry frosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Delivery details") {
                        AddressDetailView(order: order)
                    }
                }
            }
            .navigationTitle(title)
        }
    }
}

#Preview {
    PractiseView()
}
