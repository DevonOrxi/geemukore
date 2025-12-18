//
//  RemoteImage.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/12/2025.
//

import SwiftUI

struct RemoteImage: View {
	let url: URL?
	
	var body: some View {
		AsyncImage(url: url) { image in
			image
				.resizable()
				.aspectRatio(contentMode: .fill)
		} placeholder: {
			Image("game_cover")
				.resizable()
		}
	}
}
