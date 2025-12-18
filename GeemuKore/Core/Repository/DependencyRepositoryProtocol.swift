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
	var fetchGameDetail: FetchGameDetailActionProtocol { get }
	var fetchGameOverviews: FetchGameOverviewsServiceProtocol { get }
}
