//
//  GetGameDetailActionTests.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//


import Foundation
import XCTest
@testable import GeemuKore

final class GetGameDetailActionTests: XCTestCase {
	private var sut: GetGameDetailAction!
	private var result: Result<GameModel, GKError>!
	
	override func setUp() {
		super.setUp()
		
		sut = nil
		result = nil
	}
	
	func test_shouldReturnValue() async {
		givenSUT()
		await whenExecuting(game: TestModels.inputGameOverview)
		thenItReturnsResult(.success(TestModels.outputGameDetail))
	}
}

extension GetGameDetailActionTests {
	private func givenSUT() {
		sut = GetGameDetailAction()
	}
	
	private func whenExecuting(game: GameModel) async {
		do {
			let detail = try await sut.execute(id: game.id)
			result = .success(detail)
		} catch {
			result = .failure(GKError(.unknownError, underlyingError: error))
		}
	}
	
	private func thenItReturnsResult(_ expectedResult: Result<GameModel, GKError>) {
		XCTAssertEqual(result, expectedResult)
	}
}

private extension GetGameDetailActionTests {
	struct TestModels {
		static var inputGameOverview: GameModel {
			GameModel(
				id: "1",
				title: "The Legend of Zelda: Breath of the Wild",
				coverUrl: URL(string: "https://picsum.photos/id/237/200/300"),
				firstReleaseDate: .createFrom(day: 1, month: 1, year: 2017)
			)
		}
		
		static var outputGameDetail: GameModel {
			GameModel(
				id: "1",
				title: "The Legend of Zelda: Breath of the Wild",
				coverUrl: URL(string: "https://picsum.photos/id/237/200/300"),
				firstReleaseDate: .createFrom(day: 1, month: 1, year: 2017)
			)
		}
	}
}
 
