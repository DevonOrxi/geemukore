//
//  GameOverview.swift
//  GeemuKore
//
//  Created by Ariel Cid on 20/12/2025.
//

import Foundation

struct GameOverviewDTO: Codable, Sendable {
	let id: Int
	let name: String
	let firstReleaseDate: Int?     // epoch seconds
	let cover: CoverDTO?
	
	struct CoverDTO: Codable, Sendable {
		let imageId: String?
	}
}

// MARK: - Mapper helpers

extension GameOverviewDTO {
	var coverUrl: URL? {
		// CDN oficial: https://api-docs.igdb.com/#images
		// t_cover_big, t_1080p, etc.
		guard let id = cover?.imageId else { return nil }
		return URL(string: "https://images.igdb.com/igdb/image/upload/t_cover_big/\(id).jpg")
	}
	
	var releaseDate: Date? {
		guard let firstReleaseDate else { return nil }
		return Date(timeIntervalSince1970: TimeInterval(firstReleaseDate))
	}
}
