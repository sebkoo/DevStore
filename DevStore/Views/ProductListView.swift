//
//  ProductListView.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/3/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel: ProductListViewModel

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
        }
        .navigationTitle("Products")
        .task { await viewModel.fetchProducts() }
    }
}

#Preview {
    let mockService = MockProductService()
    ProductListView(viewModel: .init(service: mockService))
}
