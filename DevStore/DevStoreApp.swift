//
//  DevStoreApp.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/3/25.
//

import SwiftUI

@main
struct DevStoreApp: App {
    @StateObject private var cartManager = CartManager()

    var body: some Scene {
        WindowGroup {
            ProductListView(viewModel: ProductListViewModel(service: DefaultProductService()))
                .environmentObject(cartManager)
                .environmentObject(FavoritesManager())
        }
    }
}
