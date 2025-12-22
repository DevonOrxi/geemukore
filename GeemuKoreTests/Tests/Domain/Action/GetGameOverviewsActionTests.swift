//
//  GetGameOverviewsActionTests.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

import XCTest
@testable import GeemuKore

class GetGameOverviewsActionTests: XCTestCase {
	private var sut: GetGameOverviewsAction!
	private var fetchResult: [GameModel]?
	private var fetchError: GKError?
	private var repositorySpy: GameOverviewRepositorySpy!
	
	override func setUp() {
		sut = nil
		fetchResult = nil
		fetchError = nil
		repositorySpy = GameOverviewRepositorySpy()
	}
	
	func test_GetGameOverviewsStub() async throws {
		givenASUT()
		await whenFetching()
		thenFetchReturnsFailure(error: GKError(.unknownError))
	}
	
	func test_GetGameOverviewsStub_SettingNil() async throws {
		givenASUT()
		await whenMockingRepository(throwing: GKError(.httpError))
		await whenFetching()
		thenFetchReturnsFailure(error: GKError(.httpError))
	}
	
	func test_GetGameOverviewsStub_SettingValidResponse() async throws {
		givenASUT()
		await whenMockingRepository(returning: [
			GameDTO(
				id: "1",
				name: "Placeholder",
				firstReleaseDate: nil,
				cover: nil
			)
		])
		await whenFetching()
		thenFetchReturnsSuccess(with: [expectedModel])
	}
}

extension GetGameOverviewsActionTests {
	private func givenASUT() {
		sut = GetGameOverviewsAction(repository: repositorySpy)
	}
	
	private func whenFetching() async {
		do {
			fetchResult = try await sut.execute()
		} catch {
			fetchError = error as? GKError
		}
	}
	
	private func whenMockingRepository(returning value: [GameDTO]) async {
		await repositorySpy.setReturnResult(.success(value))
	}
	
	private func whenMockingRepository(throwing error: GKError) async {
		await repositorySpy.setReturnResult(.failure(error))
	}
	
	private func thenFetchReturnsFailure(error: GKError) {
		XCTAssertEqual(fetchError, error)
	}
	
	private func thenFetchReturnsSuccess(with result: [GameModel]) {
		XCTAssertEqual(fetchResult, result)
	}
	
	private var expectedModel: GameModel {
		GameModel(
			id: "1",
			title: "Placeholder",
			coverUrl: nil,
			firstReleaseDate: nil
		)
	}
}
