//
//  HomeViewModel.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import Foundation
import Observation
import SwiftUI

@Observable @MainActor
final class HomeViewModel {
    private(set) var games: [GameOverviewModel] = []
    private(set) var isLoading = false
    private(set) var errorMessage: String?

	private let fetchGameOverviews: FetchGameOverviewsServiceProtocol
	private let onGameSelected: @MainActor (GameOverviewModel) async -> Void

	init(fetchGameOverviews: FetchGameOverviewsServiceProtocol,
		 onGameSelected: @escaping @MainActor (GameOverviewModel) async -> Void
	) {
		self.fetchGameOverviews = fetchGameOverviews
		self.onGameSelected = onGameSelected
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
		await onGameSelected(game)
    }
}
