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
		case detail(GameModel)
	}
	
	private let rootPath: [ExploreScene] = []
	private var path: [ExploreScene] = []
	private let getGameOverviews: GetGameOverviewsActionProtocol
	private let fetchGameDetail: GetGameDetailActionProtocol
	
	init(dependencies: DependencyRepositoryProtocol) {
		self.getGameOverviews = dependencies.actions.getGameOverviews
		self.fetchGameDetail = dependencies.actions.getGameDetail
	}
	
	var view: some View {
		NavigationStack(
			path: Binding(
				get: { self.path },
				set: { [unowned self] in self.path = $0 }
			)
		) {
			ExploreCoordinatorView(
				getGameOverviews: getGameOverviews,
				getGameDetail: fetchGameDetail,
				onGameSelected: { [weak self] game in
					guard let self else { return }
					self.goToGameDetailView(for: game)
				}
			)
		}
	}
	
	private func goToGameDetailView(for game: GameModel) {
		path.append(.detail(game))
	}
	
	func onTabDoubleTap() {
		path = rootPath
	}
}
