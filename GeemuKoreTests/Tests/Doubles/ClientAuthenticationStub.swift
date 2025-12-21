//
//  ClientAuthenticationStub.swift
//  GeemuKore
//
//  Created by Ariel Cid on 21/12/2025.
//

@testable import GeemuKore

struct ClientAuthenticationStub: ClientAuthentication {
	private var stubbedId: String
	private var stubbedToken: String
	
	init(stubbedId: String = "client_id_dummy",
		 stubbedToken: String = "access_token_dummy"
	) {
		self.stubbedId = stubbedId
		self.stubbedToken = stubbedToken
	}
	
	var clientId: String { stubbedId }
	var accessToken: String { stubbedToken }
}
