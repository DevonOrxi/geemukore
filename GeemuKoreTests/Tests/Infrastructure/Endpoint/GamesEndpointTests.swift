//
//  GamesEndpointTests.swift
//  GeemuKore
//
//  Created by Ariel Cid on 21/12/2025.
//

import Testing
@testable import GeemuKore

@Suite("GamesEndpointTests")
struct GamesEndpointTests {
	private var sut: GamesEndpoint
	
	init() {
		let auth = ClientAuthentication(clientId: "client_id_dummy", accessToken: "access_token_dummy")
		
		self.sut = GamesEndpoint(auth: auth, query: "fields name; limit 1;")
	}
	
	@Test("Base URL is IGDB /v4/games")
	func test_baseUrlIsCorrect() {
		#expect(sut.urlRequest.url?.absoluteString == "https://api.igdb.com/v4/games")
	}
	
	@Test("HTTP method es POST")
	func test_methodIsPost() {
		#expect(sut.urlRequest.httpMethod == "POST")
	}
	
	@Test("Body has the correct query")
	func test_bodyHasQuery() {
		#expect(sut.urlRequest.httpBody == "fields name; limit 1;".data(using: .utf8))
	}
	
	@Test("Headers: Content-Type, Client-ID y Authorization")
	func test_headersAreSet() {
		let req = sut.urlRequest
		let contentType = req.value(forHTTPHeaderField: "Content-Type")
		let clientId = req.value(forHTTPHeaderField: "Client-ID")
		let authorization = req.value(forHTTPHeaderField: "Authorization")
		
		#expect(contentType == "text/plain")
		#expect(clientId == "client_id_dummy")
		#expect(authorization == "Bearer access_token_dummy")
	}
}
