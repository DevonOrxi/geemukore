//
//  ProfileCoordinator.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI
import Combine

final class ProfileCoordinator: ObservableObject {
	@Published var path = NavigationPath()
	
	private var pathBinding: Binding<NavigationPath> {
		Binding(
			get: { self.path },
			set: { self.path = $0 }
		)
	}
	
	func start() -> some View {
		NavigationStack(path: pathBinding) {
			EmptyView()
		}
	}
	
	func onTabDoubleTap() {
		path.removeLast(path.count)
	}
}
