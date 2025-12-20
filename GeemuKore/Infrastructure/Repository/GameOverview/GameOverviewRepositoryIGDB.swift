//
//  GameOverviewRepositoryIGDB.swift
//  GeemuKore
//
//  Created by Ariel Cid on 20/12/2025.
//

final class GameOverviewRepositoryIGDB: GameOverviewRepositoryProtocol {
	private let dispatcher: DispatcherProtocol
	private let auth: IGDBAuthentication
	private let pageSize: Int
	
	init(dispatcher: DispatcherProtocol,
		 auth: IGDBAuthentication,
		 pageSize: Int = 50) {
		self.dispatcher = dispatcher
		self.auth = auth
		self.pageSize = pageSize
	}
	
	func get() async throws -> [GameOverviewDTO] {
		// Inyectar offset para paginar (y exponer un método get(page:))
		let endpoint = GamesEndpointBuilder(auth: auth)
			.withLimit(pageSize)
			.withOffset(0)
			.build()
		let dtos: [GameOverviewDTO] = try await dispatcher.dispatch(endpoint: endpoint)
		return dtos
	}
}
