//
//  CheckoutViewModel.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import Foundation

@MainActor
final class CheckoutViewModel: ObservableObject {
    @Published var checkoutURL: URL? = nil
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let cartItems: [CartItem]
    private let paymentService: PaymentService

    init(cartItems: [CartItem], paymentService: PaymentService) {
        self.cartItems = cartItems
        self.paymentService = paymentService
    }

    func startCheckout() async {
        isLoading = true
        defer { isLoading = false }
        do {
            let session = try await paymentService.createCheckoutSession(for: cartItems)
            checkoutURL = URL(string: session.checkoutUrl)
        } catch {
            errorMessage = "Failed to start checkout: \(error.localizedDescription)"
        }
    }
}
