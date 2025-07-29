//
//  GameOverviewRepository.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

protocol GameOverviewRepository {
	func get() async -> Result<[GameOverviewDTO], GKError>
}

struct GameOverviewDTO: Decodable, Equatable {
	let id: Int
	let name: String
	let releaseDate: [Int]?
	let artworks: [Int]?
}

struct ReleaseDateDTO: Decodable {
	let id: Int
	let date: Int?
	let human: String?
}
