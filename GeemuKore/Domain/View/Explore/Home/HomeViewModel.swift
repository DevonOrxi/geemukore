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
    private(set) var games: [GameModel] = []
    private(set) var isLoading = false
    private(set) var errorMessage: String?

	private let getGameOverviews: GetGameOverviewsActionProtocol
	private let getGameDetail: GetGameDetailActionProtocol
	private let onGameSelected: @MainActor (GameModel) -> Void

	init(getGameOverviews: GetGameOverviewsActionProtocol,
		 getGameDetail: GetGameDetailActionProtocol,
		 onGameSelected: @escaping @MainActor (GameModel) -> Void
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

	func select(_ game: GameModel)
	{
		Task {
			do {
				let detail = try await getGameDetail.execute(id: game.id)
				onGameSelected(detail)
			} catch {
				print("HANDLE ERROR PAGE")
			}
		}
    }
}
