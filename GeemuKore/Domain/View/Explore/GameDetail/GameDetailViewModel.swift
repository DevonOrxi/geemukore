//
//  GameDetailViewModel.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

import Foundation

@Observable @MainActor
final class GameDetailViewModel {
	private let model: GameDetailModel
	
	var title: String {
		model.title
	}
	
	var coverUrl: URL? {
		model.coverUrl
	}
	
	var firstReleaseDate: String? {
		guard let date = model.firstReleaseDate else { return nil }
		return "\(date.year)"
	}
	
	init(model: GameDetailModel) {
		self.model = model
	}
}
