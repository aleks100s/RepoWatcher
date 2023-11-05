//
//  DoubleRepoWidgetEntry.swift
//  RepoWatcher
//
//  Created by Alexander on 05.11.2023.
//

import WidgetKit

struct DoubleRepoWidgetEntry: TimelineEntry {
	let date: Date
	let topRepository: Repository
	let bottomRepository: Repository
}
