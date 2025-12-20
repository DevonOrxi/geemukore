//
//  URLSessionDispatcher.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

import Foundation

final class URLSessionDispatcher: DispatcherProtocol {
	func dispatch<T: Decodable>(endpoint: GKEndpoint) async throws -> T {
		let request = endpoint.urlRequest
		let (data, response) = try await URLSession.shared.data(for: request)
		
		guard let httpResponse = response as? HTTPURLResponse,
			  httpResponse.statusCode == 200 else {
			throw GKError(.httpInvalidStatus)
		}
		
		do {
			let decoded = try JSONDecoder().decode(T.self, from: data)
			return decoded
		} catch {
			throw GKError(.decodeError, underlyingError: error)
		}
	}
}
