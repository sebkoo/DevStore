//
//  AuthService.swift
//  DevStore
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import Foundation

protocol AuthService {
    func login(username: String, pasword: String) async throws -> AuthToken
}
