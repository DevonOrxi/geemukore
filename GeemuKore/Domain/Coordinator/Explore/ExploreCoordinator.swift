//
//  ExploreCoordinator.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI
import Observation

@Observable @MainActor
final class ExploreCoordinator {
	enum ExploreScene: Hashable {
		case detail(GameDetailModel)
	}
	
	private let rootPath: [ExploreScene] = []
	private var path: [ExploreScene] = []
	private let fetchGameOverviews: FetchGameOverviewsServiceProtocol
	private let fetchGameDetail: FetchGameDetailActionProtocol
	
	init(dependencies: DependencyRepositoryProtocol) {
		self.fetchGameOverviews = dependencies.actions.fetchGameOverviews
		self.fetchGameDetail = dependencies.actions.fetchGameDetail
	}
	
	var view: some View {
		NavigationStack(
			path: Binding(
				get: { self.path },
				set: { [unowned self] in self.path = $0 }
			)
		) {
			ExploreCoordinatorView(
				fetchGameOverviews: fetchGameOverviews,
				fetchGameDetail: fetchGameDetail,
				onGameSelected: { [weak self] game in
					guard let self else { return }
					let gameDetail = await self.fetchGameDetail.execute(for: game)
					self.goToGameDetailView(for: gameDetail)
				}
			)
		}
	}
	
	private func goToGameDetailView(for game: GameDetailModel) {
		path.append(.detail(game))
	}
	
	func onTabDoubleTap() {
		path = rootPath
	}
}
