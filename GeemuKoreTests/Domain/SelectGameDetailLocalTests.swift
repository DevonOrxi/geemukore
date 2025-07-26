//
//  SelectGameDetailLocal.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//


import Foundation
import XCTest
@testable import GeemuKore

final class SelectGameDetailLocalTests: XCTestCase {
	private var sut: SelectGameDetailLocal!
	private var result = false
	
	override func setUp() {
		super.setUp()
		
		sut = nil
		result = false
	}
	
	func test_shouldNotCallClosureIfNotSet() async {
		givenSUT()
		await whenExecuting(game: .inputGame)
		thenClosureIsCalled(false)
	}
	
	func test_shouldNotCallClosureIfSetEmpty() async {
		givenSUT()
		givenEmptyClosure()
		await whenExecuting(game: .inputGame)
		thenClosureIsCalled(false)
	}
	
	func test_shouldNotCallClosureIfSetProperly() async {
		givenSUT()
		givenGoodSpyClosure()
		await whenExecuting(game: .inputGame)
		thenClosureIsCalled(true)
	}
}

extension SelectGameDetailLocalTests {
	private func givenSUT() {
		sut = SelectGameDetailLocal()
	}
	
	private func givenEmptyClosure() {
		sut.setNavigationToGameDetail(nil)
	}
	
	private func givenGoodSpyClosure() {
		sut.setNavigationToGameDetail { _ in
			self.result = true
		}
	}
	
	private func whenExecuting(game: GameOverviewModel) async {
		await sut.execute(for: game)
	}
	
	private func thenClosureIsCalled(_ expectedResult: Bool) {
		XCTAssertEqual(result, expectedResult)
	}
}

private extension GameOverviewModel {
	static var inputGame = GameOverviewModel(
		id: 1,
		title: "The Legend of Zelda: Breath of the Wild",
		coverURL: URL(string: "https://picsum.photos/id/237/200/300"),
		releaseDate: .createFrom(day: 1, month: 1, year: 2017)
	)
}
 
