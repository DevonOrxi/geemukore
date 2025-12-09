//
//  GKError.swift
//  GeemuKore
//
//  Created by Ariel Cid on 27/07/2025.
//

enum GKErrorCode: Int {
	case httpError = 1200
	case invalidURL = 1201
	case decodeError = 1202
	case httpInvalidStatus = 1203
	case unknownError = 1204
}

struct GKError: Error {
	let code: GKErrorCode
	
	init(_ code: GKErrorCode) {
		self.code = code
	}
	
	static var httpError: GKError { .init(.httpError )}
	static var invalidURL: GKError { .init(.invalidURL) }
	static var decodeError: GKError { .init(.decodeError) }
	static var httpInvalidStatus: GKError { .init(.httpInvalidStatus) }
	static var unknownError: GKError { .init(.unknownError) }
}

extension GKError: Equatable {}
