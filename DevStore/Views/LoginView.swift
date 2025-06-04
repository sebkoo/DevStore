//
//  LoginView.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: AuthViewModel

    var body: some View {
        VStack(spacing: 16) {
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)

            Button("Login") {
                Task { await viewModel.login() }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            if let token = viewModel.token {
                Text("✅ Token: \(token.prefix(16))...")
                    .font(.caption)
            }

            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }
        }
        .padding()
        .navigationTitle("Login")
    }
}

#Preview {
    NavigationStack {
        LoginView(viewModel: AuthViewModel(authService: MockAuthService()))
    }
}
