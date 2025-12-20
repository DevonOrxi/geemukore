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
        Task { await fetchTrending() }
    }

    func fetchTrending() async {
        isLoading = true
        defer { isLoading = false }

		do {
			let games = try await getGameOverviews.execute()
			self.games = games
		} catch {
			print("HANDLE ERROR PAGE")
		}
    }

	func select(_ game: GameOverviewModel)
	{
		Task {
			do {
				let detail = try await getGameDetail.execute(for: game)
				onGameSelected(detail)
			} catch {
				print("HANDLE ERROR PAGE")
			}
		}
    }
}
