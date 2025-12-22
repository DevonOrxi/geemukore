//
//  Game.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import Foundation

struct GameModel: Identifiable, Hashable {
    let id: String
    let title: String
    let coverUrl: URL?
    let firstReleaseDate: Date?
}
