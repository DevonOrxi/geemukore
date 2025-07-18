//
//  ProfileCoordinatorView.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI

struct ProfileCoordinatorView: View {
	@StateObject var coordinator: ProfileCoordinator
	var body: some View { coordinator.start() }
}
