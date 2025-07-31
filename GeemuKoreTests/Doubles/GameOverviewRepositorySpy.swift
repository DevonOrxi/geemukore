//
//  GameOverviewRepositorySpy.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

@testable import GeemuKore

class GameOverviewRepositorySpy: GameOverviewRepository {
	var getCalledTimes = 0
	var returnResult: Result<[GeemuKore.GameOverviewDTO], GKError> = .failure(.unknownError)
	
	func get() async -> Result<[GeemuKore.GameOverviewDTO], GeemuKore.GKError> {
		getCalledTimes += 1
		return returnResult
	}
}
