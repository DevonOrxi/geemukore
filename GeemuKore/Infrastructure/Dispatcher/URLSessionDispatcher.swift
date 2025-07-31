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
	) async -> Result<T, GKError> {
		
		guard let url = URL(string: endpoint) else {
			return .failure(.invalidURL)
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.httpBody = body.data(using: .utf8)
		
		request.setValue("text/plain", forHTTPHeaderField: "Content-Type")
		request.setValue(clientId, forHTTPHeaderField: "Client-ID")
		request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
		
		do {
			let (data, response) = try await URLSession.shared.data(for: request)
			
			guard let httpResponse = response as? HTTPURLResponse,
				  httpResponse.statusCode == 200 else {
				return .failure(.httpInvalidStatus)
			}
			
			do {
				let decoded = try JSONDecoder().decode(T.self, from: data)
				return .success(decoded)
			} catch {
				return .failure(.decodeError)
			}
		} catch {
			return .failure(.httpError)
		}
	}
}
