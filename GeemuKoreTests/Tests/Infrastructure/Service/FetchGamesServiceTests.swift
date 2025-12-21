//
//  FetchGamesServiceTests.swift
//  GeemuKore
//
//  Created by Ariel Cid on 21/12/2025.
//

import Testing
@testable import GeemuKore

@Suite("FetchGamesServiceTests")
struct FetchGamesServiceTests {
	private let sut: FetchGamesService
	private let dispatcherSpy: DispatcherSpy
	private let authProviderSpy: AuthProviderSpy
	
	init() {
		dispatcherSpy = DispatcherSpy()
		authProviderSpy = AuthProviderSpy()
		
		sut = FetchGamesService(
			dispatcher: dispatcherSpy,
			authProvider: authProviderSpy
		)
	}
	
	@Test("Default values")
	func test_getCallsDispatcherAndAuth() async throws {
		let expectedResult = [GameOverviewDTO]()
		await dispatcherSpy.setNextResult(.success(expectedResult))
		
		let _: [GameOverviewDTO] = try await sut.get()
		
		await #expect(authProviderSpy.getAuthCalledCount == 1)
		await #expect(dispatcherSpy.getReceivedEndpoints().count == 1)
	}
}
