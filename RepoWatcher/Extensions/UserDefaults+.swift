//
//  UserDefaults.swift
//  RepoWatcher
//
//  Created by Alexander on 05.11.2023.
//

import Foundation

extension UserDefaults {
	static let repoKey = "repos"
	
	static var shared: UserDefaults {
		UserDefaults(suiteName: "group.com.alextos.RepoWatcher") ?? UserDefaults.standard
	}
}

enum UserDefaultsError: Error {
	case retrieval
}
