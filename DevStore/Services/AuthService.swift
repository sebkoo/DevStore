//
//  AuthService.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import Foundation

protocol AuthService {
    func login(username: String, password: String) async throws -> AuthToken
}
