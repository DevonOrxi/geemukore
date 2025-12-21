//
//  IGDBGameOverviewRepositoryTests.swift
//  GeemuKore
//
//  Created by Ariel Cid on 21/12/2025.
//

import Testing
@testable import GeemuKore

final actor FetchGamesServiceSpy: FetchGamesServiceProtocol {
	private var getCallTimes = 0
	private var getReturnValue = [GameOverviewDTO]()
	
	func get(pageSize: Int) async throws -> [GameOverviewDTO] {
		getCallTimes += 1
		return getReturnValue
	}
	
	func getCallCount() -> Int {
		getCallTimes
	}
	
	func setGetReturnValue(_ value: [GameOverviewDTO]) {
		getReturnValue = value
	}
}

@Suite("IGDBGameOverviewRepositoryTests")
struct IGDBGameOverviewRepositoryTests {
	private let fetchGamesServiceSpy: FetchGamesServiceSpy
	private let sut: IGDBGameOverviewRepository
	
	init() {
		fetchGamesServiceSpy = FetchGamesServiceSpy()
		sut = IGDBGameOverviewRepository(service: fetchGamesServiceSpy)
	}
	
	@Test("Default values")
	func test_defaultValues() async throws {
		await #expect(fetchGamesServiceSpy.getCallCount() == 0)
	}
	
	@Test("Get calls fetch service")
	func test_getCallsFetchService() async throws {
		let _ = try await sut.get()
		
		await #expect(fetchGamesServiceSpy.getCallCount() == 1)
	}
}
