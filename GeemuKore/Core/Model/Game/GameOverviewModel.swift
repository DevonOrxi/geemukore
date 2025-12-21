//
//  Game.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import Foundation

struct GameOverviewModel: Identifiable, Hashable {
    let id: Int
    let title: String
    let coverURL: URL?
    let firstReleaseDate: Date?
}
