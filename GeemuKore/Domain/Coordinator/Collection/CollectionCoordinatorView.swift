//
//  CollectionCoordinatorView.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI

struct CollectionCoordinatorView: View {
	@StateObject var coordinator: CollectionCoordinator
	var body: some View { coordinator.start() }
}
