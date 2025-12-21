//
//  ClientAuthentication.swift
//  GeemuKore
//
//  Created by Ariel Cid on 21/12/2025.
//

protocol ClientAuthentication: Sendable {
	var clientId: String { get }
	var accessToken: String { get }
}
