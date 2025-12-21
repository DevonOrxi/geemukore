//
//  AuthProviderSpy.swift
//  GeemuKore
//
//  Created by Ariel Cid on 21/12/2025.
//

@testable import GeemuKore

final actor AuthProviderSpy: AuthProviderProtocol {
	private var getAuthCalledTimes = 0
	
	var getAuthCalledCount: Int {
		getAuthCalledTimes
	}
	
	func getAuth() async throws -> ClientAuthentication {
		getAuthCalledTimes += 1
		
		return .init(clientId: "dummyId", accessToken: "dummyToken")
	}
}
