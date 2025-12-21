//
//  GamesEndpointBuilderTests.swift
//  GeemuKore
//
//  Created by Ariel Cid on 21/12/2025.
//

import Testing
@testable import GeemuKore

@Suite("GamesEndpointBuilderTests")
struct GamesEndpointBuilderTests {
	private let sut: GamesEndpointBuilder
	
	init() {
		let auth = ClientAuthentication(clientId: "client_id_dummy", accessToken: "access_token_dummy")
		sut = GamesEndpointBuilder(auth: auth)
	}
	
	@Test("Default values")
	func test_defaultValues() {
		let endpoint = sut.build()
		
		let expected = """
		fields id,name,first_release_date,cover.image_id;
		limit 50;
		offset 0;
		"""
		let body = String(data: endpoint.urlRequest.httpBody!, encoding: .utf8)!
		#expect(body.trimmingCharacters(in: .whitespacesAndNewlines)
				== expected.trimmingCharacters(in: .whitespacesAndNewlines))
	}
	
	@Test("Custom limit and offset")
	func test_buildCustomLimitOffset() {
		let endpoint = sut
			.withLimit(10)
			.withOffset(25)
			.build()
		
		let body = String(data: endpoint.urlRequest.httpBody!, encoding: .utf8)!
		#expect(body.contains("limit 10;"))
		#expect(body.contains("offset 25;"))
	}
	
	@Test("Popularity sort")
	func test_buildWithSorting() {
		let endpoint = sut
			.withSorting(.popularity)
			.build()
		
		let body = String(data: endpoint.urlRequest.httpBody!, encoding: .utf8)!
		#expect(body.contains("sort popularity desc;"))
	}
	
	@Test("Updating Auth")
	func test_buildWithAuth() {
		let newAuth = ClientAuthentication(clientId: "new", accessToken: "new_token")
		let endpoint = sut
			.withAuth(newAuth)
			.build()
		
		let req = endpoint.urlRequest
		#expect(req.value(forHTTPHeaderField: "Client-ID") == "new")
		#expect(req.value(forHTTPHeaderField: "Authorization") == "Bearer new_token")
	}
}
