//
//  FetchGamesService.swift
//  GeemuKore
//
//  Created by Ariel Cid on 21/12/2025.
//

final class FetchGamesService: FetchGamesServiceProtocol {
	private let dispatcher: DispatcherProtocol
	private let authProvider: AuthProviderProtocol
	
	init(dispatcher: DispatcherProtocol,
		 authProvider: AuthProviderProtocol
	) {
		self.dispatcher = dispatcher
		self.authProvider = authProvider
	}
	
	func get(pageSize: Int = 50) async throws -> [GameDTO] {
		let auth = try await authProvider.getAuth()
		let endpoint = GamesEndpointBuilder(auth: auth)
			.withLimit(pageSize)
			.withOffset(0)
			.build()
		
		return try await dispatcher.dispatch(endpoint: endpoint)
	}
}
