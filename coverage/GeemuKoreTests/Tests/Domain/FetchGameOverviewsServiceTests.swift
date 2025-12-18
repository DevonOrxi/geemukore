//
//  FetchGameOverviewsServiceTests.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

import XCTest
@testable import GeemuKore

class FetchGameOverviewsServiceTests: XCTestCase {
	private var sut: FetchGameOverviewsService!
	private var fetchResult: [GameOverviewModel]?
	private var fetchError: GKError?
	private var repositorySpy: GameOverviewRepositorySpy!
	
	override func setUp() {
		sut = nil
		fetchResult = nil
		fetchError = nil
		repositorySpy = GameOverviewRepositorySpy()
	}
	
	func test_FetchGameOverviewsStub() async throws {
		givenASUT()
		await whenFetching()
		thenFetchReturnsFailure(error: GKError(.unknownError))
	}
	
	func test_FetchGameOverviewsStub_SettingNil() async throws {
		givenASUT()
		await whenMockingRepository(throwing: GKError(.httpError))
		await whenFetching()
		thenFetchReturnsFailure(error: GKError(.httpError))
	}
	
	func test_FetchGameOverviewsStub_SettingValidResponse() async throws {
		givenASUT()
		await whenMockingRepository(returning: [
			GameOverviewDTO(
				id: 1,
				name: "Placeholder",
				releaseDate: nil,
				artworks: nil
			)
		])
		await whenFetching()
		thenFetchReturnsSuccess(with: [expectedModel])
	}
}

extension FetchGameOverviewsServiceTests {
	private func givenASUT() {
		sut = FetchGameOverviewsService(repository: repositorySpy)
	}
	
	private func whenFetching() async {
		do {
			fetchResult = try await sut.fetch()
		} catch {
			fetchError = error as? GKError
		}
	}
	
	private func whenMockingRepository(returning value: [GameOverviewDTO]) async {
		await repositorySpy.setReturnResult(.success(value))
	}
	
	private func whenMockingRepository(throwing error: GKError) async {
		await repositorySpy.setReturnResult(.failure(error))
	}
	
	private func thenFetchReturnsFailure(error: GKError) {
		XCTAssertEqual(fetchError, error)
	}
	
	private func thenFetchReturnsSuccess(with result: [GameOverviewModel]) {
		XCTAssertEqual(fetchResult, result)
	}
	
	private var expectedModel: GameOverviewModel {
		GameOverviewModel(
			id: 1,
			title: "Placeholder",
			coverURL: nil,
			releaseDate: nil
		)
	}
}
