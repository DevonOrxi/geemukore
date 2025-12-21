//
//  GKEndpoint.swift
//  GeemuKore
//
//  Created by Ariel Cid on 20/12/2025.
//

import Foundation

protocol GKEndpoint: Sendable {
	var urlRequest: URLRequest { get }
}
