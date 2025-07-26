//
//  Date+.swift
//  GeemuKore
//
//  Created by Ariel Cid on 18/07/2025.
//

import Foundation

extension Date {
	var year: Int {
		Calendar.autoupdatingCurrent.component(.year, from: self)
	}
	
	static func createFrom(day: Int, month: Int, year: Int) -> Date? {
		DateComponents(calendar: .autoupdatingCurrent, year: year, month: month, day: day).date
	}
}
