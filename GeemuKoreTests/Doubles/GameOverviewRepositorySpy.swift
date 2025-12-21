//
//  GameOverviewRepositorySpy.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

@testable import GeemuKore

final class GameOverviewRepositorySpy: GameOverviewRepositoryProtocol {
	
	private actor State {
		var getCalledTimes = 0
		var returnResult: Result<[GameOverviewDTO], GKError> = .failure(GKError(.unknownError))
		
		func recordGetCall() {
			getCalledTimes += 1
		}
		
		func setReturnResult(_ newResult: Result<[GameOverviewDTO], GKError>) {
			returnResult = newResult
		}
	}
	
	private let state = State()
	
	func get(pageSize: Int) async throws -> [GameOverviewDTO] {
		await state.recordGetCall()
		
		let result = await state.returnResult
		switch result {
		case .success(let value):
			return value
		case .failure(let error):
			throw error
		}
	}
	
	// MARK: - Test Helpers
	
	func getCalledTimes() async -> Int {
		await state.getCalledTimes
	}
	
	func setReturnResult(_ result: Result<[GameOverviewDTO], GKError>) async {
		await state.setReturnResult(result)
	}
}
