//
//  GetGameOverviews.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

protocol GetGameOverviewsActionProtocol: Sendable {
	func execute() async throws -> [GameModel]
}

