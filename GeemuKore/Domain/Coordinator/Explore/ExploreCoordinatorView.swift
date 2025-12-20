//
//  ExploreCoordinatorView.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI

struct ExploreCoordinatorView: View {
	typealias ExploreScene = ExploreCoordinator.ExploreScene
	private let getGameOverviews: GetGameOverviewsActionProtocol
	private let getGameDetail: GetGameDetailActionProtocol
	private let onGameSelected: @MainActor (GameDetailModel) -> Void
	
	init(getGameOverviews: GetGameOverviewsActionProtocol,
		 getGameDetail: GetGameDetailActionProtocol,
		 onGameSelected: @escaping @MainActor (GameDetailModel) -> Void
	) {
		self.getGameOverviews = getGameOverviews
		self.getGameDetail = getGameDetail
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
			getGameOverviews: getGameOverviews,
			getGameDetail: getGameDetail,
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
