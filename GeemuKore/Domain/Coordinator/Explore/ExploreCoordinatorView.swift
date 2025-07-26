//
//  ExploreCoordinatorView.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI

struct ExploreCoordinatorView: View {
	typealias ExploreScene = ExploreCoordinator.ExploreScene
	private let selectGameDetail: SelectGameDetail
	
	init(selectGameDetail: SelectGameDetail) {
		self.selectGameDetail = selectGameDetail
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
			selectGameDetail: selectGameDetail
		)
		return HomeView(viewModel: viewModel)
	}
	
	@ViewBuilder
	private func detailView(with game: GameDetailModel) -> some View {
		let viewModel = GameDetailViewModel(model: game)
		GameDetailView(viewModel: viewModel)
	}
}
