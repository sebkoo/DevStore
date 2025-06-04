//
//  ProductListView.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/3/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel: ProductListViewModel
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
                NavigationLink(destination: ProductDetailView(viewModel: .init(product: product))) {
                    VStack(alignment: .leading) {
                        Text(product.title)
                            .font(.headline)
                        Text("$\(product.price, specifier: "%.2f")")
                    }
                }
            }
            .navigationTitle("Products")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CheckoutView(
                        viewModel: CheckoutViewModel(
                            cartItems: cartManager.items,
                            paymentService: MockPaymentService()
                        )
                    )) {
                        HStack {
                            Image(systemName: "cart")
                            Text("\(cartManager.totalCount)")
                        }
                    }
                }
            }
            .task { await viewModel.fetchProducts() }
        }
    }
}

#Preview {
    let mockService = MockProductService()
    let viewModel = ProductListViewModel(service: mockService)
    let cartManager = CartManager()

    ProductListView(viewModel: viewModel)
        .environmentObject(cartManager)
}
