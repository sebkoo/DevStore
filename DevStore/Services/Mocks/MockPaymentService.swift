//
//  MockPaymentService.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import Foundation

final class MockPaymentService: PaymentService {
    func createCheckoutSession(for items: [CartItem]) async throws -> CheckoutSession {
        // Simulated mock session
        return CheckoutSession(checkoutUrl: "https://buy.stripe.com/test_mock_checkout")
    }
}
