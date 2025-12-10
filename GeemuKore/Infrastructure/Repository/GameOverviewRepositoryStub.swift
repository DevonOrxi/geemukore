//
//  GameOverviewRepositoryStub.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

class GameOverviewRepositoryStub: GameOverviewRepository {
	func get() async throws -> [GameOverviewDTO] {
		[
			GameOverviewDTO(
				id: 1,
				name: "The Legend of Zelda: Breath of the Wild",
				releaseDate: nil,
				artworks: nil
			),
			GameOverviewDTO(
				id: 2,
				name: "Hollow Knight",
				releaseDate: nil,
				artworks: nil
			),
			GameOverviewDTO(
				id: 3,
				name: "Celeste",
				releaseDate: nil,
				artworks: nil
			)
//			GameOverviewModel(
//				id: 1,
//				title: "The Legend of Zelda: Breath of the Wild",
//				coverURL: URL(string: "https://picsum.photos/id/237/200/300"),
//				releaseDate: .createFrom(day: 1, month: 1, year: 2017)
//			),
//			GameOverviewModel(
//				id: 2,
//				title: "Hollow Knight",
//				coverURL: URL(string: "https://picsum.photos/id/1025/200/300"),
//				releaseDate: .createFrom(day: 1, month: 1, year: 2017)
//			),
//			GameOverviewModel(
//				id: 3,
//				title: "Celeste",
//				coverURL: URL(string: "https://picsum.photos/id/1005/200/300"),
//				releaseDate: .createFrom(day: 1, month: 1, year: 2017)
//			)
		]
	}
}
