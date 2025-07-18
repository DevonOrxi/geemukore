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
            .tag(Tab.home)
        GameCollectionView(coordinator: tabCoordinator.collection)
            .tabItem { Label("Collection", systemImage: "tray.full") }
            .tag(Tab.collection)
        ProfileView(coordinator: tabCoordinator.profile)
            .tabItem { Label("Profile", systemImage: "person.circle") }
            .tag(Tab.profile)
        }
        .onReceive(tabCoordinator.tabTapPublisher) { tappedTab in
            tabCoordinator.handleTabTap(tappedTab)
        }
    }
}

#Preview {

}
