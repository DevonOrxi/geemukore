//
//  TabCoordinator.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI
import Combine

final class TabCoordinator: ObservableObject {
	@Published var currentTab: TabElement = .home
	
	// Sub-coordinators
	let home = ExploreCoordinator()
	let collection = CollectionCoordinator()
	let profile = ProfileCoordinator()
	
	// Publisher para taps
	let tabTapPublisher = PassthroughSubject<TabElement, Never>()
	
	func handleTabTap(_ tab: TabElement) {
		switch tab {
		case .home: home.popToRoot()
		case .collection: collection.popToRoot()
		case .profile: profile.popToRoot()
		}
	}
}
