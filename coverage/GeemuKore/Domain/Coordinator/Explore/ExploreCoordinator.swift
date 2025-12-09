//
//  ExploreCoordinator.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI
import Observation

@Observable
final class ExploreCoordinator {
	enum ExploreScene: Hashable {
		case detail(GameDetailModel)
	}
	
	private let rootPath: [ExploreScene] = []
	private var path: [ExploreScene] = []
	private var fetchGameOverviews: FetchGameOverviewsServiceProtocol
	private var selectGameDetail: SelectGameDetail
	
	init(fetchGameOverviews: FetchGameOverviewsServiceProtocol,
		 selectGameDetail: SelectGameDetail) {
		self.fetchGameOverviews = fetchGameOverviews
		self.selectGameDetail = selectGameDetail
		setup()
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
				selectGameDetail: selectGameDetail
			)
		}
	}
	
	private func setup() {
		selectGameDetail.setNavigationToGameDetail{ [weak self] game in
			self?.goToGameDetailView(for: game)
		}
	}
	
	private func goToGameDetailView(for game: GameDetailModel) {
		path.append(.detail(game))
	}
	
	func onTabDoubleTap() {
		path = rootPath
	}
}
