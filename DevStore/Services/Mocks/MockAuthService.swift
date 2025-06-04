//
//  MockAuthService.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import Foundation

final class MockAuthService: AuthService {
    func login(username: String, password: String) async throws -> AuthToken {
        return AuthToken(token: "mock_token_1234567890")
    }
}
