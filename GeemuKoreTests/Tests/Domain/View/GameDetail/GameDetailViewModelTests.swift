//
//  GameDetailViewModelTests.swift
//  GeemuKoreTests
//
//  Created by Ariel Cid on 21/12/2025.
//

import Testing
import Foundation
@testable import GeemuKore

@Suite("GameDetailViewModelTests")
struct GameDetailViewModelTests {
	private let sut: GameDetailViewModel
	
	init() async {
		let model = GameModel(
			id: "1",
			title: "The Legend of Zelda: Breath of the Wild",
			coverUrl: URL(string: "https://picsum.photos/id/237/200/300"),
			firstReleaseDate: .createFrom(day: 1, month: 1, year: 2017)
		)
		
		sut = await GameDetailViewModel(model: model)
	}
	
	@Test("Init")
	func test_init() async throws {
		await #expect(sut.coverUrl?.absoluteString == "https://picsum.photos/id/237/200/300" )
		await #expect(sut.title == "The Legend of Zelda: Breath of the Wild")
		await #expect(sut.firstReleaseDate == "2017")
	}
}
