//
//  Repository.swift
//  RepoWatcherWidgetExtension
//
//  Created by Alexander on 29.10.2023.
//

import Foundation

struct Repository {
	let name: String
	let owner: Owner
	let hasIssues: Bool
	let forks: Int
	let watchers: Int
	let openIssues: Int
	let pushedAt: Date
	
	var avatarData = Data()
	var contributors = [Contributor]()
}
