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

        let fetchResult = await fetchGameOverviews.fetch()
		switch fetchResult {
		case .success(let games):
			self.games = games
		case .failure(let error):
			print("ERROR A TRATAR LUEGO")
		}
    }

	func select(_ game: GameOverviewModel) async {
		await selectGameDetail.execute(for: game)
    }
}
