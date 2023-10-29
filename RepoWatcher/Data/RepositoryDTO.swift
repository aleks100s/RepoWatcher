//
//  RepositoryDTO.swift
//  RepoWatcher
//
//  Created by Alexander on 29.10.2023.
//

import Foundation

struct RepositoryDTO: Decodable {
	let name: String
	let owner: Owner
	let hasIssues: Bool
	let forks: Int
	let watchers: Int
	let openIssues: Int
	let pushedAt: String
}

extension Repository {
	private static let formatter = ISO8601DateFormatter()

	init(dto: RepositoryDTO) {
		self = Repository(
			name: dto.name,
			owner: dto.owner,
			hasIssues: dto.hasIssues,
			forks: dto.forks,
			watchers: dto.watchers,
			openIssues: dto.openIssues,
			pushedAt: Self.formatter.date(from: dto.pushedAt) ?? Date()
		)
	}
}
