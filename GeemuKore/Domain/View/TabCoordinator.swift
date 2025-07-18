//
//  TabCoordinator.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI
import Combine

final class TabCoordinator: ObservableObject {
    enum Tab { case home, collection, profile }
    @Published var currentTab: Tab = .home

    // Sub-coordinators
    let home = ExploreCoordinator()
    let collection = CollectionCoordinator()
    let profile = ProfileCoordinator()

    // Publisher para taps
    let tabTapPublisher = PassthroughSubject<Tab, Never>()

    func handleTabTap(_ tab: Tab) {
        switch tab {
        case .home: home.popToRoot()
        case .collection: collection.popToRoot()
        case .profile: profile.popToRoot()
        }
    }
}
