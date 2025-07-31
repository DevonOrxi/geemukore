//
//  FetchGameOverviewsPreviewStub.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

#if DEBUG
import Foundation

class FetchGameOverviewsPreviewStub: FetchGameOverviewsServiceProtocol {
	func fetch() async -> Result<[GameOverviewModel], GKError> {
		.success([
			GameOverviewModel(
				id: 1,
				title: "The Legend of Zelda: Breath of the Wild",
				coverURL: URL(string: "https://picsum.photos/id/237/200/300"),
				releaseDate: .createFrom(day: 1, month: 1, year: 2017)
			),
			GameOverviewModel(
				id: 2,
				title: "Hollow Knight",
				coverURL: URL(string: "https://picsum.photos/id/1025/200/300"),
				releaseDate: .createFrom(day: 1, month: 1, year: 2017)
			),
			GameOverviewModel(
				id: 3,
				title: "Celeste",
				coverURL: URL(string: "https://picsum.photos/id/1005/200/300"),
				releaseDate: .createFrom(day: 1, month: 1, year: 2017)
			)
		])
	}
}
#endif
