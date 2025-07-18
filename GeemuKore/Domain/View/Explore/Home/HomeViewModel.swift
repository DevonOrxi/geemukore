//
//  HomeViewModel.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published private(set) var games: [Game] = []
    @Published private(set) var isLoading = false
    @Published var errorMessage: String?

    private let coordinator: ExploreCoordinator
    private var cancellables = Set<AnyCancellable>()

    init(coordinator: ExploreCoordinator) {
        self.coordinator = coordinator
        Task { await fetchTrending() }
    }

    func fetchTrending() async {
        isLoading = true
        defer { isLoading = false }

        do {
            // 🔸AQUÍ llamaremos al cliente TGDB (mock por ahora)
            try await Task.sleep(for: .seconds(1))   // simulamos red
            games = Stub.games
        } catch {
			errorMessage = "No se pudieron obtener los datos: \(error.localizedDescription)"
        }
    }

    func select(_ game: Game) {
        coordinator.showDetail(for: game)
    }
}

enum Stub {
    static let games: [Game] = [
        Game(id: 1,
             title: "The Legend of Zelda: Breath of the Wild",
             coverURL: URL(string: "https://picsum.photos/id/237/200/300"),
             releaseDate: .createFrom(day: 1, month: 1, year: 2017)),
        Game(id: 2,
             title: "Hollow Knight",
             coverURL: URL(string: "https://picsum.photos/id/1025/200/300"),
             releaseDate: .createFrom(day: 1, month: 1, year: 2017)),
        Game(id: 3,
             title: "Celeste",
             coverURL: URL(string: "https://picsum.photos/id/1005/200/300"),
             releaseDate: .createFrom(day: 1, month: 1, year: 2017))
    ]
}

extension Date {
    static func createFrom(day: Int, month: Int, year: Int) -> Date? {
        DateComponents(calendar: .autoupdatingCurrent, year: year, month: month, day: day).date
    }
}
