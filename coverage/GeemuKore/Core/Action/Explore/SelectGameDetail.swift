//
//  FetchGameDetail.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

protocol FetchGameDetailActionProtocol: Sendable {
	func execute(for game: GameOverviewModel) async -> GameDetailModel
}


