//
//  DependencyRepositoryLocal.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

class DependencyRepositoryLocal: DependencyRepository {
	private let gameOverviewRepository = GameOverviewRepositoryStub()
	
	lazy var actions: ActionRepository = ActionRepositoryLocal(
		gameOverviewRepository: gameOverviewRepository
	)
}

class ActionRepositoryLocal: ActionRepository {
	lazy var selectGameDetail: SelectGameDetail = SelectGameDetailLocal()
	lazy var fetchGameOverviews: FetchGameOverviewsServiceProtocol = FetchGameOverviewsService(repository: gameOverviewRepository)
	
	private let gameOverviewRepository: GameOverviewRepository
	
	init(gameOverviewRepository: GameOverviewRepository) {
		self.gameOverviewRepository = gameOverviewRepository
	}
}
