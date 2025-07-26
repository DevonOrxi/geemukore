//
//  DependencyRepository.swift
//  GeemuKore
//
//  Created by Ariel Cid on 26/07/2025.
//

protocol DependencyRepository {
	var actions: ActionRepository { get }
}

protocol ActionRepository {
	var selectGameDetail: SelectGameDetail { get }
}
