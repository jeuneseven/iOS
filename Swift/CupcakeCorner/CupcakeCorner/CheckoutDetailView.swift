//
//  CheckoutDetailView.swift
//  CupcakeCorner
//
//  Created by seven on 2025/8/30.
//

import SwiftUI

private let title = "Check out"

struct CheckoutDetailView: View {
    @State private var isShowingAlert = false
    @State private var alertMessage = ""
    
    var order: OrderModel
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Text(phase.error?.localizedDescription ?? "Image loaded error")
                    } else {
                        ProgressView()
                    }
                }
                .frame(height: 233)
                
                Text("Your total cost is \(order.cost, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    .font(.title)
                
                Button("Place order", action: {
                    Task {
                        await placeOrder()
                    }
                })
                    .padding()
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thanks", isPresented: $isShowingAlert) {
            Button("OK") {}
        } message: {
            Text(alertMessage)
        }
    }
    
    func placeOrder() async {
        guard let encodeOrder = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        // (lldb)  p String(decoding: encodeOrder, as: UTF8.self)
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.setValue("reqres-free-v1", forHTTPHeaderField: "x-api-key")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encodeOrder)
            let decodeOrder = try JSONDecoder().decode(OrderModel.self, from: data)
            
            alertMessage = "Your order for \(decodeOrder.quantity)x\(Order.types[decodeOrder.type].lowercased()) cupcakes is on its way!"
            isShowingAlert = true
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    CheckoutDetailView(order: OrderModel())
}
