//
//  GameOverviewRepository.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

protocol GameOverviewRepositoryProtocol: Sendable {
	func get(pageSize: Int) async throws -> [GameDTO]
}
