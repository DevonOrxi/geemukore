//
//  FetchGameDetailLocal.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

import Foundation

final class GetGameDetailAction: GetGameDetailActionProtocol {
	func execute(id: String) async throws -> GameModel {
		// TODO: Fetch en API
		let gameDetail = GameModel(
			id: id,
			title: "The Legend of Zelda: Breath of the Wild",
			coverUrl: URL(string: "https://picsum.photos/id/237/200/300"),
			firstReleaseDate: .createFrom(day: 1, month: 1, year: 2017)
		)
		return gameDetail
	}
}
