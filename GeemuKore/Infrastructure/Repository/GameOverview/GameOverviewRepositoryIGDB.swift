//
//  GameOverviewRepositoryIGDB.swift
//  GeemuKore
//
//  Created by Ariel Cid on 20/12/2025.
//

final class IGDBGameOverviewRepository: GameOverviewRepositoryProtocol {
	private let service: FetchGamesServiceProtocol
	
	init(service: FetchGamesServiceProtocol) {
		self.service = service
	}
	
	func get(pageSize: Int = 50) async throws -> [GameDTO] {
		try await service.get(pageSize: pageSize)
	}
}
