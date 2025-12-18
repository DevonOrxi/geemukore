//
//  DependencyRepositoryLocal.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

final class DependencyRepository: DependencyRepositoryProtocol {
	private let gameOverviewRepository = GameOverviewRepositoryStub()
	
	lazy var actions: ActionRepositoryProtocol = ActionRepository(
		gameOverviewRepository: gameOverviewRepository
	)
}

final class ActionRepository: ActionRepositoryProtocol {
	lazy var fetchGameDetail: FetchGameDetailActionProtocol = FetchGameDetailAction()
	lazy var fetchGameOverviews: FetchGameOverviewsServiceProtocol = FetchGameOverviewsService(repository: gameOverviewRepository)
	
	private let gameOverviewRepository: GameOverviewRepositoryProtocol
	
	init(gameOverviewRepository: GameOverviewRepositoryProtocol) {
		self.gameOverviewRepository = gameOverviewRepository
	}
}

