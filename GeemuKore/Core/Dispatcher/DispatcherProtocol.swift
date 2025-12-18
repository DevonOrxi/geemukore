//
//  DispatcherProtocol.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

protocol DispatcherProtocol {
	func dispatch<T: Decodable>(endpoint: String, body: String, clientId: String, accessToken: String) async throws -> T
}
