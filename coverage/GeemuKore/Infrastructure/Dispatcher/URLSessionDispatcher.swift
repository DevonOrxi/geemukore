//
//  URLSessionDispatcher.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

import Foundation

class URLSessionDispatcher: DispatcherProtocol {
	func dispatch<T: Decodable>(
		endpoint: String,
		body: String,
		clientId: String,
		accessToken: String
	) async throws -> T {
		guard let url = URL(string: endpoint) else {
			throw GKError(.invalidURL)
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.httpBody = body.data(using: .utf8)
		
		request.setValue("text/plain", forHTTPHeaderField: "Content-Type")
		request.setValue(clientId, forHTTPHeaderField: "Client-ID")
		request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
		
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
