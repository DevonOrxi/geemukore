//
//  ProfileCoordinator.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI
import Observation

@Observable
final class ProfileCoordinator {
	enum ProfileScene: Hashable {
		// TODO: Cases
	}
	
	private let rootPath: [ProfileScene] = []
	private var path: [ProfileScene] = []
	
	var view: some View {
		NavigationStack(
			path: Binding(
				get: { self.path },
				set: { [unowned self] in self.path = $0 }
			)
		) {
			EmptyView()
		}
	}
	
	func onTabDoubleTap() {
		path.removeLast(path.count)
	}
}
