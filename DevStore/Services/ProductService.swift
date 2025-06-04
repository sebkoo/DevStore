//
//  ProductService.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/3/25.
//

import Foundation

protocol ProductService {
    func fetchProducts() async throws -> [Product]
}
