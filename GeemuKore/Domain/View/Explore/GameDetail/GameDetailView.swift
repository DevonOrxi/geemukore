//
//  GameDetailView.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

import SwiftUI

struct GameDetailView: View {
	@State var viewModel: GameDetailViewModel
	
	init(viewModel: GameDetailViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		ScrollView {
			HStack {
				VStack {
					RemoteImage(url: viewModel.coverUrl)
						.frame(width: 120, height: 180)
						.cornerRadius(8)
					
					HStack {
						Rectangle()
							.foregroundStyle(Color(.systemGreen))
							.frame(width: 32, height: 32)
							.cornerRadius(4)
							.overlay {
								Image(systemName: "play.fill")
									.foregroundStyle(.white)
							}
						
						Rectangle()
							.foregroundStyle(Color(.systemOrange))
							.frame(width: 32, height: 32)
							.cornerRadius(4)
							.overlay {
								Image(systemName: "bookmark.fill")
									.foregroundStyle(.white)
							}
						
						Rectangle()
							.foregroundStyle(Color(.systemRed))
							.frame(width: 32, height: 32)
							.cornerRadius(4)
							.overlay {
								Image(systemName: "heart.fill")
									.foregroundStyle(.white)
							}
					}
				}
				
				Spacer()
					.frame(width: 16)
				
				VStack {
					Spacer()
						.frame(height: 0)
					
					Text(viewModel.title)
						.font(.system(size: 24, weight: .semibold))
						.frame(maxWidth: .infinity, alignment: .topLeading)
					
					Spacer()
						.frame(height: 8)
					
					HStack {
						Text(viewModel.firstReleaseDate ?? "???")
							.font(.system(size: 14, weight: .regular))
							.padding(.horizontal, 8)
							.padding(.vertical, 4)
							.background(
								Capsule()
									.fill(Color(.systemGray))
									.opacity(0.5)
							)
						
						Spacer()
					}
					
					Spacer()
				}
			}
			.padding(.horizontal, 16)
			
			Spacer()
		}
	}
}

#Preview {
	GameDetailView(viewModel: .preview)
}

private extension GameDetailViewModel {
	static var preview: GameDetailViewModel {
		GameDetailViewModel(model: .init(
			id: 1,
			title: "The Legend of Zelda: Breath of the Wild",
			coverUrl: nil,
			firstReleaseDate: .createFrom(day: 1, month: 1, year: 2017))
		)
	}
}
