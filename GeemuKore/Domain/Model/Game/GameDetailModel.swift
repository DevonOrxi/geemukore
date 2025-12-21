//
//  GameDetail.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

import Foundation

struct GameDetailModel: Identifiable, Hashable {
	let id: Int
	let title: String
	let coverUrl: URL?
	let firstReleaseDate: Date?
}
