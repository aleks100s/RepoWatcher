//
//  ContributorDTO.swift
//  RepoWatcher
//
//  Created by Alexander on 30.10.2023.
//

struct ContributorDTO: Decodable {
	let login: String
	let avatarUrl: String
	let contributions: Int
}

extension Contributor {
	init(dto: ContributorDTO) {
		self = Contributor(login: dto.login, avatarUrl: dto.avatarUrl, contributions: dto.contributions)
	}
}
