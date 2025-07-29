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
	private var fetchResult: Result<[GameOverviewModel], GKError>!
	private var repositorySpy: GameOverviewRepositorySpy!
	
	override func setUp() {
		sut = nil
		fetchResult = nil
		repositorySpy = GameOverviewRepositorySpy()
	}
	
	func test_FetchGameOverviewsStub() async throws {
		givenASUT()
		await whenFetching()
		thenFetchReturnsFailure(error: .unknownError)
	}
	
	func test_FetchGameOverviewsStub_SettingNil() async throws {
		givenASUT()
		whenMockingRepository(with: .failure(.httpError))
		await whenFetching()
		thenFetchReturnsFailure(error: .httpError)
	}
	
	func test_FetchGameOverviewsStub_SettingValidResponse() async throws {
		givenASUT()
		whenMockingRepository(with: .success([
			GameOverviewDTO(
				id: 1,
				name: "Placeholder",
				releaseDate: nil,
				artworks: nil
			)
		]))
		await whenFetching()
		thenFetchReturnsSuccess(with: [expectedModel])
	}
}

extension FetchGameOverviewsServiceTests {
	private func givenASUT() {
		sut = FetchGameOverviewsService(repository: repositorySpy)
	}
	
	private func whenFetching() async {
		fetchResult = await sut.fetch()
	}
	
	private func whenMockingRepository(with result: Result<[GameOverviewDTO], GKError>) {
		repositorySpy.returnResult = result
	}
	
	private func thenFetchReturnsFailure(error: GKError) {
		XCTAssertEqual(fetchResult, .failure(error))
	}
	
	private func thenFetchReturnsSuccess(with result: [GameOverviewModel]) {
		XCTAssertEqual(fetchResult, .success(result))
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
