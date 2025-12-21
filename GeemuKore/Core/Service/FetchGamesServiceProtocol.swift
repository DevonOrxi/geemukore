//
//  FetchGamesServiceProtocol.swift
//  GeemuKore
//
//  Created by Ariel Cid on 21/12/2025.
//

protocol FetchGamesServiceProtocol: Sendable {
	func get(pageSize: Int) async throws -> [GameOverviewDTO]
}
