//
//  DependencyRepositoryLocal.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

class DependencyRepositoryLocal: DependencyRepository {
	lazy var actions: ActionRepository = ActionRepositoryLocal()
}

class ActionRepositoryLocal: ActionRepository {
	lazy var selectGameDetail: SelectGameDetail = SelectGameDetailLocal()
}
