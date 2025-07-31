//
//  GameDetailViewModel.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

import Observation

@Observable @MainActor
final class GameDetailViewModel {
	private let model: GameDetailModel
	
	init(model: GameDetailModel) {
		self.model = model
	}
}
