//
//  GetGameOverviewsService.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

import Foundation

final class GetGameOverviewsAction: GetGameOverviewsActionProtocol, Sendable {
	private let repository: GameOverviewRepositoryProtocol
	
	init(repository: GameOverviewRepositoryProtocol) {
		self.repository = repository
	}
	
	func execute() async throws -> [GameModel] {
		try await repository.get(pageSize: 50)
			.map {
				GameModel(
					id: $0.id,
					title: $0.name,
					coverUrl: nil,
					firstReleaseDate: nil
				)
			}
	}
}
