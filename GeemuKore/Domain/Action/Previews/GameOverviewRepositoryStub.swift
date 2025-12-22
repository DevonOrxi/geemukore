//
//  GameOverviewRepositoryStub.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

final class GameOverviewRepositoryStub: GameOverviewRepositoryProtocol {
	func get(pageSize: Int) async throws -> [GameDTO] {
		[
			GameDTO(
				id: "1",
				name: "The Legend of Zelda: Breath of the Wild",
				firstReleaseDate: nil,
				cover: nil
			),
			GameDTO(
				id: "2",
				name: "Hollow Knight",
				firstReleaseDate: nil,
				cover: nil
			),
			GameDTO(
				id: "3",
				name: "Celeste",
				firstReleaseDate: nil,
				cover: nil
			)
		]
	}
}
