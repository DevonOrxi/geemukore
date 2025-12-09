//
//  FetchGameDetailLocal.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

class SelectGameDetailLocal: SelectGameDetail {
	private var navitateToGameDetail: ((GameDetailModel) -> Void)? = nil
	
	// TODO: Usar ID solamente
	func execute(for game: GameOverviewModel) async {
		// TODO: Fetch en API
		let gameDetail = GameDetailModel(
			id: game.id,
			title: game.title,
			coverURL: game.coverURL,
			releaseDate: game.releaseDate
		)
		
		navitateToGameDetail?(gameDetail)
	}
	
	func setNavigationToGameDetail(_ navitateToGameDetail: ((GameDetailModel) -> Void)? = nil) {
		self.navitateToGameDetail = navitateToGameDetail
	}
}
