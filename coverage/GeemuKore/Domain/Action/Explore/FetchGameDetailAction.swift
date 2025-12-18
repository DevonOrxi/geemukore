//
//  FetchGameDetailLocal.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

import Foundation

final class FetchGameDetailAction: FetchGameDetailActionProtocol {
	// TODO: Usar ID solamente
	func execute(for game: GameOverviewModel) async -> GameDetailModel {
		// TODO: Fetch en API
		let gameDetail = GameDetailModel(
			id: game.id,
			title: game.title,
			coverURL: game.coverURL,
			releaseDate: game.releaseDate
		)
		return gameDetail
	}
}
