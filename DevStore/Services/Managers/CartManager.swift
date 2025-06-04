//
//  CartManager.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import Foundation

@MainActor
final class CartManager: ObservableObject {
    @Published private(set) var items: [CartItem] = []

    private let key = "CART_ITEMS"

    init() { loadCart() }

    func addToCart(product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(id: product.id, product: product, quantity: 1))
        }
        saveCart()
    }

    func removeFromCart(productId: Int) {
        items.removeAll { $0.product.id == productId }
        saveCart()
    }

    func clearCart() {
        items = []
        saveCart()
    }

    private func saveCart() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    private func loadCart() {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decoded = try? JSONDecoder().decode([CartItem].self, from: data) else { return }
        self.items = decoded
    }

    var totalCount: Int {
        items.reduce(0) { $0 + $1.quantity }
    }
}
