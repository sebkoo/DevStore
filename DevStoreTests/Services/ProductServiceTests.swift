//
//  ProductServiceTests.swift
//  DevStoreTests
//
//  Created by Bonmyeong Koo - Vendor on 6/3/25.
//

import XCTest
@testable import DevStore

final class ProductServiceTests: XCTestCase {
    func testFetchProducts() async throws {
        let service = MockProductService()
        let products = try await service.fetchProducts()
        XCTAssertEqual(products.count, 1)
        XCTAssertEqual(products[0].title, "Mock Product")
    }
}
