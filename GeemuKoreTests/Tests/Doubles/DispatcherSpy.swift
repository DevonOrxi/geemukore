//
//  DispatcherSpy.swift
//  GeemuKore
//
//  Created by Ariel Cid on 21/12/2025.
//

@testable import GeemuKore

final actor DispatcherSpy: DispatcherProtocol {
	private var receivedEndpoints: [any GKEndpoint] = []
	private  var nextResult: Result<Any, Error>? = nil
	
	public func setNextResult(_ result: Result<Any, Error>) {
		nextResult = result
	}
	
	public func getReceivedEndpoints() -> [any GKEndpoint] {
		receivedEndpoints
	}
	
	func dispatch<T: Decodable & Sendable>(endpoint: any GKEndpoint) async throws -> T where T : Decodable {
		receivedEndpoints.append(endpoint)
		
		let next = nextResult ?? .failure(GKError(.unknownError))
		
		switch next {
		case .failure(let error):
			throw error
		case .success(let any):
			guard let typed = any as? T else { throw GKError(.unknownError) }
			return typed
		}
	}
}
