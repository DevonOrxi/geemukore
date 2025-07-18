//
//  ExploreCoordinatorView.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import SwiftUI

struct ExploreCoordinatorView: View {
  @StateObject var coordinator: ExploreCoordinator
  var body: some View { coordinator.start() }
}
