//
//  Date+.swift
//  RepoWatcher
//
//  Created by Alexander on 29.10.2023.
//

import Foundation

extension Date {
	var daysPassedUntilNow: Int {
		Calendar.current.dateComponents([.day], from: self, to: .now).day ?? 0
	}
}
