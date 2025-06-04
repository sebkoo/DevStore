//
//  ProductDetailView.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/3/25.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject var viewModel: ProductDetailViewModel
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: viewModel.product.image)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if phase.error != nil {
                        Color.red
                    } else {
                        ProgressView()
                    }
                }
                .frame(height: 300)

                Text(viewModel.product.title)
                    .font(.title)
                    .fontWeight(.bold)

                Text("$\(viewModel.product.price, specifier: "%.2f")")
                    .font(.title2)
                    .foregroundColor(.green)

                Text(viewModel.product.description)
                    .font(.body)

                Button {
                    cartManager.addToCart(product: viewModel.product)
                } label: {
                    Text("Add to Cart")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Product Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let product = Product(id: 1, title: "Mock Product", price: 19.99, description: "Description", category: "electronics", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")
    ProductDetailView(viewModel: .init(product: product))
}
