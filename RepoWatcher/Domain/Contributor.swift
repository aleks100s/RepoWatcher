//
//  Contributoy.swift
//  RepoWatcher
//
//  Created by Alexander on 30.10.2023.
//

import Foundation

struct Contributor: Identifiable, Hashable {
	let login: String
	let avatarUrl: String
	let contributions: Int
	
	var avatarData = Data()
	
	var id: String {
		login
	}
}
