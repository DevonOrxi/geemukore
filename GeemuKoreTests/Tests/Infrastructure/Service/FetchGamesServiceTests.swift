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
	
	@Test("Starting values")
	func test_startingValues() async throws {
		await #expect(authProviderSpy.getAuthCalledCount == 0)
		await #expect(dispatcherSpy.getReceivedEndpoints().count == 0)
	}
	
	@Test("Get calls Dispatcher and Auth")
	func test_getCallsDispatcherAndAuth() async throws {
		let expectedResult = [GameDTO]()
		await dispatcherSpy.setNextResult(.success(expectedResult))
		
		let _: [GameDTO] = try await sut.get()
		
		await #expect(authProviderSpy.getAuthCalledCount == 1)
		await #expect(dispatcherSpy.getReceivedEndpoints().count == 1)
	}
}
