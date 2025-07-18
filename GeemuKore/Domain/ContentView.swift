//
//  ContentView.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI

struct ContentView: View {
	@StateObject var tabCoordinator = TabCoordinator()
	
	var body: some View {
		TabView(selection: $tabCoordinator.currentTab) {
			ExploreCoordinatorView(coordinator: tabCoordinator.home)
				.tabItem { Label("Explore", systemImage: "gamecontroller") }
				.tag(TabElement.home)
			
			CollectionCoordinatorView(coordinator: tabCoordinator.collection)
				.tabItem { Label("Collection", systemImage: "tray.full") }
				.tag(TabElement.collection)
			
			ProfileCoordinatorView(coordinator: tabCoordinator.profile)
				.tabItem { Label("Profile", systemImage: "person.circle") }
				.tag(TabElement.profile)
		}
		.onReceive(tabCoordinator.tabTapPublisher) { tappedTab in
			tabCoordinator.handleTabTap(tappedTab)
		}
	}
}

#Preview {
	
}
