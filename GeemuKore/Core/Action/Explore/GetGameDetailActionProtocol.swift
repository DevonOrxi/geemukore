//
//  FetchGameDetail.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

protocol GetGameDetailActionProtocol: Sendable {
	func execute(id: String) async throws -> GameModel
}


