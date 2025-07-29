//
//  FetchGameDetail.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

protocol SelectGameDetail {
	func execute(for game: GameOverviewModel) async
	func setNavigationToGameDetail(_ navitateToGameDetail: ((GameDetailModel) -> Void)?)
}
