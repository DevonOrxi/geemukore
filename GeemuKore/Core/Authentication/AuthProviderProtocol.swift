//
//  AuthProviderProtocol.swift
//  GeemuKore
//
//  Created by Ariel Cid on 21/12/2025.
//

protocol AuthProviderProtocol: Sendable {
	func getAuth() async throws -> ClientAuthentication
}
