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
	let underlyingError: Error?
	
	init(_ code: GKErrorCode, underlyingError: Error? = nil) {
		self.code = code
		self.underlyingError = underlyingError
	}
}

extension GKError: Equatable {
	static func == (lhs: GKError, rhs: GKError) -> Bool {
		lhs.code == rhs.code
	}
}
