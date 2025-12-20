//
//  DispatcherProtocol.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

protocol DispatcherProtocol: Sendable {
	func dispatch<T: Decodable>(endpoint: GKEndpoint) async throws -> T
}
