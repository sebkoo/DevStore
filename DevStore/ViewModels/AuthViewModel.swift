//
//  AuthViewModel.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import Foundation

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var token: String?
    @Published var errorMessage: String?
    @Published var isLoading = false

    private let authService: AuthService

    init(authService: AuthService) {
        self.authService = authService
    }

    func login() async {
        isLoading = true
        defer { isLoading = false }

        do {
            let auth = try await authService.login(username: username, password: password)
            token = auth.token
            UserDefaults.standard.set(auth.token, forKey: "TOKEN")
        } catch {
            errorMessage = "Login failed: \(error.localizedDescription)"
        }
    }

    func logout() {
        token = nil
        UserDefaults.standard.removeObject(forKey: "TOKEN")
    }
}
