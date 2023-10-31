//
//  Contributor+.swift
//  RepoWatcher
//
//  Created by Alexander on 30.10.2023.
//

extension Contributor {
	static var dummy: Contributor {
		Contributor(login: "kek_lol_\(Int.random(in: 10 ..< 1000))", avatarUrl: "", contributions: Int.random(in: 1 ..< 100))
	}
}
