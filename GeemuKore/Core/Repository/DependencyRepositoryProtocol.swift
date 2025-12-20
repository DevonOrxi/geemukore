//
//  DependencyRepository.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

protocol DependencyRepositoryProtocol {
	var actions: ActionRepositoryProtocol { get }
}

protocol ActionRepositoryProtocol {
	var getGameOverviews: GetGameOverviewsActionProtocol { get }
	var getGameDetail: GetGameDetailActionProtocol { get }
}
