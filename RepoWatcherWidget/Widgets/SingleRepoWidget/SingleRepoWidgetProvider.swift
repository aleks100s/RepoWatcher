//
//  Provider.swift
//  RepoWatcher
//
//  Created by Alexander on 29.10.2023.
//

import WidgetKit

struct SingleRepoWidgetProvider: AppIntentTimelineProvider {
	func placeholder(in context: Context) -> SingleRepoWidgetEntry {
		SingleRepoWidgetEntry(date: Date(), repository: .dummy1)
	}

	func snapshot(for configuration: SelectSingleRepo, in context: Context) -> SingleRepoWidgetEntry {
		SingleRepoWidgetEntry(date: Date(), repository: .dummy1)
	}

	func timeline(for configuration: SelectSingleRepo, in context: Context) async -> Timeline<SingleRepoWidgetEntry> {
		let nextUpdate = Date().addingTimeInterval(86400) // 24h
		do {
			let url = API.prefix + (configuration.repository ?? "")
			var repository = try await NetworkManager.shared.getRepo(url: url)
			let avatarData = try await NetworkManager.shared.downloadImageData(url: repository.owner.avatarUrl)
			repository.avatarData = avatarData
			
			let entry = SingleRepoWidgetEntry(date: .now, repository: repository)
			return Timeline(entries: [entry], policy: .after(nextUpdate))
		} catch {
			print("❌ error - \(error.localizedDescription)")
			return Timeline(entries: [], policy: .after(nextUpdate))
		}
	}
}
