//
//  ExploreCoordinator.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI
import Combine

final class ExploreCoordinator: ObservableObject {
	@Published var path = NavigationPath()
	
	private var pathBinding: Binding<NavigationPath> {
		Binding(
			get: { self.path },
			set: { self.path = $0 }
		)
	}
	
	func start() -> some View {
		NavigationStack(path: pathBinding) {
			HomeView(viewModel: HomeViewModel(coordinator: self))
				.navigationDestination(for: Game.self) { game in
					EmptyView()
					//          GameDetailView(viewModel: GameDetailViewModel(game: game))
				}
		}
	}
	
	func showDetail(for game: Game) {
		path.append(game)
	}
	
	func popToRoot() {
		path.removeLast(path.count)
	}
}
