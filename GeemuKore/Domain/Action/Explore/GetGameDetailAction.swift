//
//  FetchGameDetailLocal.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

import Foundation

final class GetGameDetailAction: GetGameDetailActionProtocol {
	// TODO: Usar ID solamente
	func execute(for game: GameOverviewModel) async throws -> GameDetailModel {
		// TODO: Fetch en API
		let gameDetail = GameDetailModel(
			id: game.id,
			title: game.title,
			coverUrl: game.coverUrl,
			firstReleaseDate: game.firstReleaseDate
		)
		return gameDetail
	}
}
