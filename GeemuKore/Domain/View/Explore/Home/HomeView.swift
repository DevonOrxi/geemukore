//
//  HomeView.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI

struct HomeView: View {
	@State var viewModel: HomeViewModel
	
	var body: some View {
		Group {
			if !viewModel.isLoading {
				gameListView
			} else {
				ProgressView("Loading…")
			}
		}
		.navigationTitle("Explore")
	}
	
	var gameListView: some View {
		List(viewModel.games) { game in
			Button {
				viewModel.select(game)
			} label: {
				gameCell(for: game)
			}
		}
		.listStyle(.plain)
	}
	
	@ViewBuilder
	func gameCell(for game: GameOverviewModel) -> some View {
		HStack {
			gameCellCover(using: game.coverUrl)
			gameCellInfo(title: game.title, releaseDate: .createFrom(day: 1, month: 1, year: 2017))
		}
	}
	
	@ViewBuilder
	func gameCellCover(using coverUrl: URL?) -> some View {
		RemoteImage(url: coverUrl)
			.frame(width: 60, height: 90)
			.cornerRadius(8)
	}
	
	@ViewBuilder
	func gameCellInfo(title: String, releaseDate: Date?) -> some View {
		VStack(alignment: .leading, spacing: 4) {
			Text(title)
				.font(.headline)
			
			if let releaseDate {
				Text(String(releaseDate.year))
					.font(.subheadline)
					.foregroundStyle(.secondary)
			}
		}
	}
}

#Preview {
	HomeView(viewModel: .preview)
}

private extension HomeViewModel {
	static var preview: HomeViewModel {
		HomeViewModel(
			getGameOverviews: GetGameOverviewsActionStub(),
			getGameDetail: GetGameDetailActionStub(),
			onGameSelected: { _ in }
		)
	}
}
