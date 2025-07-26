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
			exploreView
				.tabItem { Label("Explore", systemImage: "gamecontroller") }
				.tag(TabElement.explore)
			
			collectionView
				.tabItem { Label("Collection", systemImage: "tray.full") }
				.tag(TabElement.collection)
			
			profileView
				.tabItem { Label("Profile", systemImage: "person.circle") }
				.tag(TabElement.profile)
		}
		.onReceive(tabCoordinator.tabTapPublisher) { tappedTab in
			tabCoordinator.handleTabTap(tappedTab)
		}
	}
	
	private var exploreView: some View {
		tabCoordinator.explore.view
	}
	
	private var collectionView: some View {
		tabCoordinator.collection.view
	}
	
	private var profileView: some View {
		tabCoordinator.profile.view
	}
}

#Preview {
	
}
