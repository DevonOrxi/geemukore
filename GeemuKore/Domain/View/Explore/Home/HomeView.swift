//
//  HomeView.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI

struct HomeView: View {
	@StateObject var viewModel: HomeViewModel
	
	var body: some View {
		Group {
			if viewModel.isLoading {
				ProgressView("Loading…")
			} else {
				List(viewModel.games) { game in
					Button {
						viewModel.select(game)
					} label: {
						HStack {
							AsyncImage(url: game.coverURL) { image in
								image.resizable().aspectRatio(contentMode: .fill)
							} placeholder: {
								Color.gray.opacity(0.3)
							}
							.frame(width: 60, height: 90)
							.cornerRadius(8)
							
							VStack(alignment: .leading, spacing: 4) {
								Text(game.title)
									.font(.headline)
								if let date = game.releaseDate {
									Text(String(date.year))
										.font(.subheadline)
										.foregroundStyle(.secondary)
								}
							}
						}
					}
				}
				.listStyle(.plain)
			}
		}
		.navigationTitle("Explore")
		.alert("Error",
			   isPresented: Binding(
				get: { viewModel.errorMessage != nil },
				set: { if !$0 { viewModel.errorMessage = nil } }
			   )
		) {
			// acciones (vacías → solo botón OK)
		} message: {
			if let msg = viewModel.errorMessage {
				Text(msg)
			}
		}
	}
}
