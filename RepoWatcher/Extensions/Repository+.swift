//
//  Repository+.swift
//  RepoWatcher
//
//  Created by Alexander on 29.10.2023.
//

import Foundation

extension Repository {
	static let dummy1 = Repository(
		name: "Your repo",
		owner: Owner(avatarUrl: "Heh"),
		hasIssues: true,
		forks: 123,
		watchers: 456,
		openIssues: 999,
		pushedAt: Date()
	)
	
	static let dummy2 = Repository(
		name: "Another repo",
		owner: Owner(avatarUrl: "Mda"),
		hasIssues: false,
		forks: 321,
		watchers: 1,
		openIssues: 999,
		pushedAt: Date()
	)
}
