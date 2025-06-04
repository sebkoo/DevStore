//
//  ProductListView.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel: ProductListViewModel
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
                HStack {
                    NavigationLink(destination: ProductDetailView(viewModel: .init(product: product))) {
                        VStack(alignment: .leading) {
                            Text(product.title).font(.headline)
                            Text("$\(product.price, specifier: "%.2f")")
                        }
                    }

                    Spacer()

                    Button {
                        favoritesManager.toggleFavorite(product)
                    } label: {
                        Image(systemName: favoritesManager.isFavorite(product) ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                    }
                    .buttonStyle(.plain)
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
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink("Login") {
                        LoginView(viewModel: AuthViewModel(authService: DefaultAuthService()))
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
    let favoritesManager = FavoritesManager()

    return ProductListView(viewModel: viewModel)
        .environmentObject(cartManager)
        .environmentObject(favoritesManager)
}
