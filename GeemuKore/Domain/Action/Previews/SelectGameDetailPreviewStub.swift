//
//  SelectGameDetailPreviewStub.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

#if DEBUG
class SelectGameDetailPreviewStub: SelectGameDetail {
	func execute(for game: GameOverviewModel) async {}
	func setNavigationToGameDetail(_ navitateToGameDetail: ((GameDetailModel) -> Void)?) {}
}
#endif
