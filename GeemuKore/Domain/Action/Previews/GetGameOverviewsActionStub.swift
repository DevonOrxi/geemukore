//
//  GetGameOverviewsActionStub.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

#if DEBUG
import Foundation

final class GetGameOverviewsActionStub: GetGameOverviewsActionProtocol {
	func execute() async throws -> [GameModel] {
		[
			GameModel(
				id: "1",
				title: "The Legend of Zelda: Breath of the Wild",
				coverUrl: URL(string: "https://picsum.photos/id/237/200/300"),
				firstReleaseDate: .createFrom(day: 1, month: 1, year: 2017)
			),
			GameModel(
				id: "2",
				title: "Hollow Knight",
				coverUrl: URL(string: "https://picsum.photos/id/1025/200/300"),
				firstReleaseDate: .createFrom(day: 1, month: 1, year: 2017)
			),
			GameModel(
				id: "3",
				title: "Celeste",
				coverUrl: URL(string: "https://picsum.photos/id/1005/200/300"),
				firstReleaseDate: .createFrom(day: 1, month: 1, year: 2017)
			)
		]
	}
}
#endif
