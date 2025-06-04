//
//  CheckoutView.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import SwiftUI
import SafariServices

struct CheckoutView: View {
    @StateObject var viewModel: CheckoutViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            if let url = viewModel.checkoutURL {
                Button("Open Checkout in Safari") {
                    UIApplication.shared.open(url)
                }
                .padding()
            } else if viewModel.isLoading {
                ProgressView("Starting checkout...")
            } else {
                Button("Start Checkout") {
                    Task { await viewModel.startCheckout() }
                }
                .padding()
            }

            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            Task { await viewModel.startCheckout() }
        }
    }
}

#Preview {
    let mockItems = [
        CartItem(
            id: 1,
            product: Product(
                id: 1,
                title: "Test Product",
                price: 29.99,
                description: "Sample product description",
                category: "electronics",
                image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"),
            quantity: 2
        )
    ]

    let mockService = MockPaymentService()
    let viewModel = CheckoutViewModel(cartItems: mockItems, paymentService: mockService)

    return NavigationView {
        CheckoutView(viewModel: viewModel)
    }
}
