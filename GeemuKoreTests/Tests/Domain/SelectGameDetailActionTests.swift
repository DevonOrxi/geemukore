//
//  FetchGameDetailActionTests.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//


import Foundation
import XCTest
@testable import GeemuKore

final class FetchGameDetailActionTests: XCTestCase {
	private var sut: FetchGameDetailAction!
	private var result: GameDetailModel!
	
	override func setUp() {
		super.setUp()
		
		sut = nil
		result = nil
	}
	
	
	func test_shouldReturnValue() async {
		givenSUT()
		await whenExecuting(game: TestModels.inputGameOverview)
		thenItReturnsResult(TestModels.outputGameDetail)
	}
}

extension FetchGameDetailActionTests {
	private func givenSUT() {
		sut = FetchGameDetailAction()
	}
	
	private func whenExecuting(game: GameOverviewModel) async {
		result = await sut.execute(for: game)
	}
	
	private func thenItReturnsResult(_ expectedResult: GameDetailModel) {
		XCTAssertEqual(result, expectedResult)
	}
}

private extension FetchGameDetailActionTests {
	struct TestModels {
		static var inputGameOverview: GameOverviewModel {
			GameOverviewModel(
				id: 1,
				title: "The Legend of Zelda: Breath of the Wild",
				coverURL: URL(string: "https://picsum.photos/id/237/200/300"),
				releaseDate: .createFrom(day: 1, month: 1, year: 2017)
			)
		}
		
		static var outputGameDetail: GameDetailModel {
			GameDetailModel(
				id: 1,
				title: "The Legend of Zelda: Breath of the Wild",
				coverURL: URL(string: "https://picsum.photos/id/237/200/300"),
				releaseDate: .createFrom(day: 1, month: 1, year: 2017)
			)
		}
	}
}
 
