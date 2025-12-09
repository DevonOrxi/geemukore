//
//  FetchGameOverviewsService.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

import Foundation

class FetchGameOverviewsService: FetchGameOverviewsServiceProtocol {
	private let repository: GameOverviewRepository
	
	init(repository: GameOverviewRepository) {
		self.repository = repository
	}
	
	func fetch() async -> Result<[GameOverviewModel], GKError> {
		await repository.get()
			.map { result in
				result.map {
					GameOverviewModel(
						id: $0.id,
						title: $0.name,
						coverURL: nil,
						releaseDate: nil
						// TODO: Map these
					)
				}
			}
	}
}
