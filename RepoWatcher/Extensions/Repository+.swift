//
//  Repository+.swift
//  RepoWatcher
//
//  Created by Alexander on 29.10.2023.
//

import Foundation

extension Repository {
	static let dummy1 = Repository(
		name: "Repository #1",
		owner: Owner(avatarUrl: "Heh"),
		hasIssues: true,
		forks: Int.random(in: 100 ..< 999),
		watchers: Int.random(in: 100 ..< 999),
		openIssues: Int.random(in: 100 ..< 999),
		pushedAt: Date().addingTimeInterval(-60 * 60 * 24 * Double(Int.random(in: 50 ..< 150))),
		contributors: [.dummy, .dummy, .dummy, .dummy]
	)
	
	static let dummy2 = Repository(
		name: "Repository #2",
		owner: Owner(avatarUrl: "Mda"),
		hasIssues: false,
		forks: Int.random(in: 100 ..< 999),
		watchers: Int.random(in: 100 ..< 999),
		openIssues: Int.random(in: 100 ..< 999),
		pushedAt: Date().addingTimeInterval(-60 * 60 * 24 * Double(Int.random(in: 50 ..< 150))),
		contributors: [.dummy, .dummy, .dummy]
	)
}
