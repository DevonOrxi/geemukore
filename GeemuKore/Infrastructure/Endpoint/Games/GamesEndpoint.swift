//
//  GamesEndpoint.swift
//  GeemuKore
//
//  Created by Ariel Cid on 20/12/2025.
//

import Foundation

class GamesEndpointBuilder {
	enum SortType: String {
		case popularity
	}
	
	private var auth: ClientAuthentication
	private var limit: Int = 50
	private var offset: Int = 0
	private var sortType: SortType?
	
	init(auth: ClientAuthentication) {
		self.auth = auth
	}
	
	func withAuth(_ auth: ClientAuthentication) -> GamesEndpointBuilder {
		self.auth = auth
		return self
	}
	
	func withLimit(_ limit: Int) -> GamesEndpointBuilder {
		self.limit = limit
		return self
	}
	
	func withOffset(_ offset: Int) -> GamesEndpointBuilder {
		self.offset = offset
		return self
	}
	
	func withSorting(_ sortType: SortType) -> GamesEndpointBuilder {
		self.sortType = sortType
		return self
	}
	
	func build() -> GamesEndpoint {
		GamesEndpoint(auth: auth, query: query)
	}
	
	private var query: String {
		var q = "fields id,name,first_release_date,cover.image_id;"
		
		if let sortType {
			q += "\nsort \(sortType.rawValue) desc;"
		}
		
		q += "\nlimit \(limit);\noffset \(offset);"
		
		return q
	}
}

struct GamesEndpoint: GKEndpoint {
	private let baseURL = URL(string: "https://api.igdb.com/v4/games")!
	private let auth: ClientAuthentication
	private let query: String
	
	init(auth: ClientAuthentication, query: String) {
		self.auth = auth
		self.query = query
	}
	
	var urlRequest: URLRequest {
		var req = URLRequest(url: baseURL)
		req.httpMethod = "POST"
		req.httpBody = query.data(using: .utf8)
		req.setValue("text/plain", forHTTPHeaderField: "Content-Type")
		req.setValue(auth.clientId, forHTTPHeaderField: "Client-ID")
		req.setValue("Bearer \(auth.accessToken)", forHTTPHeaderField: "Authorization")
		return req
	}
}
