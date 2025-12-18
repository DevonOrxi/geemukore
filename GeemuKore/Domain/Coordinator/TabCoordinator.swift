//
//  TabCoordinator.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI
import Combine

@Observable @MainActor
final class TabCoordinator {
	var currentTab: TabElement = .explore

	private(set) var explore: ExploreCoordinator
	private(set) var collection: CollectionCoordinator
	private(set) var profile: ProfileCoordinator
	private let dependencies: DependencyRepositoryProtocol
	
	init(dependencies: DependencyRepositoryProtocol = DependencyRepository()) {
		self.dependencies = dependencies
		self.explore = .init(dependencies: dependencies)
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
