//
//  TabCoordinator.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI
import Combine

final class TabCoordinator: ObservableObject {
	@Published var currentTab: TabElement = .explore

	private(set) var explore: ExploreCoordinator
	private(set) var collection: CollectionCoordinator
	private(set) var profile: ProfileCoordinator
	private let dependencies: DependencyRepository
	
	init(dependencies: DependencyRepository = DependencyRepositoryLocal()) {
		self.dependencies = dependencies
		self.explore = .init(selectGameDetail: dependencies.actions.selectGameDetail)
		self.collection = .init()
		self.profile = .init()
	}
	
	private(set) var tabTapPublisher = PassthroughSubject<TabElement, Never>()
	
	func handleTabTap(_ tab: TabElement) {
		switch tab {
		case .explore: explore.onTabDoubleTap()
		case .collection: collection.onTabDoubleTap()
		case .profile: profile.onTabDoubleTap()
		}
	}
}
