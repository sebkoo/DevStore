//
//  ProductListViewModel.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/3/25.
//

import Foundation

@MainActor
final class ProductListViewModel: ObservableObject {
    @Published private(set) var products: [Product] = []

    private let service: ProductService

    init(service: ProductService) {
        self.service = service
    }

    func fetchProducts() async {
        do {
            products = try await service.fetchProducts()
        } catch {
            print("Error: \(error)")
        }
    }
}
