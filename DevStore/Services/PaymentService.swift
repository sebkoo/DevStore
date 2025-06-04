//
//  PaymentService.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import Foundation

protocol PaymentService {
    func createCheckoutSession(for items: [CartItem]) async throws -> CheckoutSession
}
