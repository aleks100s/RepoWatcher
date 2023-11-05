//
//  ContributorProvider.swift
//  RepoWatcher
//
//  Created by Alexander on 30.10.2023.
//

import WidgetKit

struct ContributorWidgetProvider: IntentTimelineProvider {
	func placeholder(in context: Context) -> ContributorWidgetEntry {
		ContributorWidgetEntry(date: Date(), repository: .dummy1)
	}

	func getSnapshot(for configuration: SelectSingleRepoIntent, in context: Context, completion: @escaping (ContributorWidgetEntry) -> ()) {
		let entry = ContributorWidgetEntry(date: Date(), repository: .dummy1)
		completion(entry)
	}

	func getTimeline(for configuration: SelectSingleRepoIntent, in context: Context, completion: @escaping (Timeline<ContributorWidgetEntry>) -> ()) {
		Task {
			let url = API.prefix + (configuration.repository ?? "")
			var repository = try await NetworkManager.shared.getRepo(url: url)
			let avatarData = try await NetworkManager.shared.downloadImageData(url: repository.owner.avatarUrl)
			repository.avatarData = avatarData
			var contributors = try await NetworkManager.shared.getContributors(url: url + "/contributors")
			contributors = Array(contributors.prefix(4))
			let avatars = try await withThrowingTaskGroup(of: (Contributor, Data).self, returning: [Contributor: Data].self) { group in
				var avatars = [Contributor: Data]()
				contributors.forEach { contributor in
					group.addTask {
						let data = try await NetworkManager.shared.downloadImageData(url: contributor.avatarUrl)
						return (contributor, data)
					}
				}
				for try await (contributor, data) in group {
					avatars[contributor] = data
				}
				return avatars
			}
			for i in contributors.indices {
				contributors[i].avatarData = avatars[contributors[i]] ?? Data()
			}
			
			repository.contributors = contributors
			let entry = ContributorWidgetEntry(date: .now, repository: repository)
			let nextUpdate = Date().addingTimeInterval(86400) // 24h
			let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
			completion(timeline)
		}
	}
}
