//
//  GetGameDetailPreviewStub.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/12/2025.
//

#if DEBUG
import Foundation

final class GetGameDetailActionStub: GetGameDetailActionProtocol {
	func execute(id: String) async throws -> GameModel {
		GameModel(
			id: id,
			title: "The Legend of Zelda: Breath of the Wild",
			coverUrl: URL(string: "https://picsum.photos/id/237/200/300"),
			firstReleaseDate: .createFrom(day: 1, month: 1, year: 2017)
		)
	}
}
#endif
