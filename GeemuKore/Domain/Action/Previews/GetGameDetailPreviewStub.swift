//
//  GetGameDetailPreviewStub.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/12/2025.
//

#if DEBUG
import Foundation

final class GetGameDetailPreviewStub: GetGameDetailActionProtocol {
	func execute(for game: GameOverviewModel) async throws -> GameDetailModel {
		GameDetailModel(
			id: game.id,
			title: game.title,
			coverUrl: game.coverUrl,
			firstReleaseDate: game.firstReleaseDate
		)
	}
}
#endif
