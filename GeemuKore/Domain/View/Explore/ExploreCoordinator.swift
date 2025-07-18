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

  func start() -> some View {
    NavigationStack(path: $path) {
      HomeView(viewModel: HomeViewModel(coordinator: self))
//        .navigationDestination(for: Game.self) { game in
//          GameDetailView(viewModel: GameDetailViewModel(game: game))
//        }
    }
  }

  func showDetail(for game: Game) {
    path.append(game)
  }

  func popToRoot() {
    path.removeLast(path.count)
  }
}
