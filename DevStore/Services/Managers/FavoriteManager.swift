//
//  FavoriteManager.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import Foundation

@MainActor
final class FavoriteManager: ObservableObject {
    @Published private(set) var favorites: Set<Int> = []
    private let key = "FAVORITE_PRODUCTS"

    init() { loadFavorites() }

    func toggleFavorite(_ product: Product) {
        if favorites.contains(product.id) {
            favorites.remove(product.id)
        } else {
            favorites.insert(product.id)
        }
        saveFavorites()
    }

    func isFavorite(_ product: Product) -> Bool {
        favorites.contains(product.id)
    }

    private func saveFavorites() {
        let ids = Array(favorites)
        UserDefaults.standard.set(ids, forKey: key)
    }

    private func loadFavorites() {
        if let ids = UserDefaults.standard.array(forKey: key) as? [Int] {
            favorites = Set(ids)
        }
    }
}
