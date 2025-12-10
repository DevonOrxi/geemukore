//
//  HomeViewModel.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import Foundation
import Observation

@Observable @MainActor
final class HomeViewModel {
    private(set) var games: [GameOverviewModel] = []
    private(set) var isLoading = false
    var errorMessage: String?

	private let fetchGameOverviews: FetchGameOverviewsServiceProtocol
    private let selectGameDetail: SelectGameDetail

	init(fetchGameOverviews: FetchGameOverviewsServiceProtocol,
		 selectGameDetail: SelectGameDetail) {
        self.selectGameDetail = selectGameDetail
		self.fetchGameOverviews = fetchGameOverviews
        Task { await fetchTrending() }
    }

    func fetchTrending() async {
        isLoading = true
        defer { isLoading = false }

		do {
			let games = try await fetchGameOverviews.fetch()
			self.games = games
		} catch {
			print("HANDLE ERROR PAGE")
		}
    }

	func select(_ game: GameOverviewModel) async {
		await selectGameDetail.execute(for: game)
    }
}
