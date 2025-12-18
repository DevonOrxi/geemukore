//
//  ExploreCoordinatorView.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI

struct ExploreCoordinatorView: View {
	typealias ExploreScene = ExploreCoordinator.ExploreScene
	private let fetchGameOverviews: FetchGameOverviewsServiceProtocol
	private let fetchGameDetail: FetchGameDetailActionProtocol
	private let onGameSelected: @MainActor (GameOverviewModel) async -> Void
	
	init(fetchGameOverviews: FetchGameOverviewsServiceProtocol,
		 fetchGameDetail: FetchGameDetailActionProtocol,
		 onGameSelected: @escaping @MainActor (GameOverviewModel) async -> Void
	) {
		self.fetchGameOverviews = fetchGameOverviews
		self.fetchGameDetail = fetchGameDetail
		self.onGameSelected = onGameSelected
	}
	
	var body: some View {
		homeView
			.navigationDestination(
				for: ExploreScene.self,
				destination: sceneView
			)
	}
	
	@ViewBuilder
	private func sceneView(for scene: ExploreScene) -> some View {
		switch scene {
		case let .detail(game):
			detailView(with: game)
		}
	}
	
	private var homeView: some View {
		let viewModel = HomeViewModel(
			fetchGameOverviews: fetchGameOverviews,
			onGameSelected: onGameSelected
		)
		return HomeView(viewModel: viewModel)
	}
	
	@ViewBuilder
	private func detailView(with game: GameDetailModel) -> some View {
		let viewModel = GameDetailViewModel(model: game)
		GameDetailView(viewModel: viewModel)
	}
}
