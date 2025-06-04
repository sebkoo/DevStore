//
//  CartItem.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/3/25.
//

import Foundation

struct CartItem: Codable, Identifiable, Equatable {
    let id: Int
    let product: Product
    var quantity: Int
}
