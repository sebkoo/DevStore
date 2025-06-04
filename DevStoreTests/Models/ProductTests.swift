//
//  DevStoreTests.swift
//  DevStoreTests
//
//  Created by Bonmyeong Koo - Vendor on 6/3/25.
//

import XCTest
@testable import DevStore

final class ProductTests: XCTestCase {
    func testProductDecoding() throws {
        let json = """
        {
            "id": 1,
            "title": "Test Product",
            "price": 9.99,
            "description": "A product",
            "category": "electronics",
            "image": "https://example.com/image.png"
        }
        """.data(using: .utf8)!

        let product = try JSONDecoder().decode(Product.self, from: json)
        XCTAssertEqual(product.title, "Test Product")
        XCTAssertEqual(product.price, 9.99)
    }
}
