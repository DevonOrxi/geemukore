//
//  GameOverviewRepositorySpy.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

@testable import GeemuKore

class GameOverviewRepositorySpy: GameOverviewRepository {
	var getCalledTimes = 0
	var returnResult: Result<[GameOverviewDTO], GKError> = .failure(GKError(.unknownError))
	
	func get() async throws -> [GameOverviewDTO] {
		getCalledTimes += 1
		
		switch returnResult {
		case .success(let value):
		return value
		case .failure(let error):
		throw error
		}
	}
}
