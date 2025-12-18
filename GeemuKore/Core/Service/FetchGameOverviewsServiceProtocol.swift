//
//  FetchGameOverviews.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

protocol FetchGameOverviewsServiceProtocol: Sendable {
	func fetch() async throws -> [GameOverviewModel]
}

