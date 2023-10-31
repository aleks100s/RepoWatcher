//
//  SimpleEntry.swift
//  RepoWatcher
//
//  Created by Alexander on 29.10.2023.
//

import WidgetKit

struct CompactRepoWidgetEntry: TimelineEntry {
	let date: Date
	let topRepository: Repository
	let bottomRepository: Repository?
}
