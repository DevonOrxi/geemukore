//
//  GameDetailViewModel.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

import SwiftUI

@MainActor
final class GameDetailViewModel: ObservableObject {
	private let model: GameDetailModel
	
	init(model: GameDetailModel) {
		self.model = model
	}
}
