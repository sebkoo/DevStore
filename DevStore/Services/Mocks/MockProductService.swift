//
//  MockProductService.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/3/25.
//

import Foundation

final class MockProductService: ProductService {
    func fetchProducts() async throws -> [Product] {
        return [Product(id: 1, title: "Mock Product", price: 10, description: "", category: "", image: "")]
    }
}
