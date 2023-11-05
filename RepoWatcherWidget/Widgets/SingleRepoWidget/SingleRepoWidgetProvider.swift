//
//  Provider.swift
//  RepoWatcher
//
//  Created by Alexander on 29.10.2023.
//

import WidgetKit

struct SingleRepoWidgetProvider: IntentTimelineProvider {
	func placeholder(in context: Context) -> SingleRepoWidgetEntry {
		SingleRepoWidgetEntry(date: Date(), repository: .dummy1)
	}

	func getSnapshot(for configuration: SelectSingleRepoIntent, in context: Context, completion: @escaping (SingleRepoWidgetEntry) -> ()) {
		let entry = SingleRepoWidgetEntry(date: Date(), repository: .dummy1)
		completion(entry)
	}

	func getTimeline(for configuration: SelectSingleRepoIntent, in context: Context, completion: @escaping (Timeline<SingleRepoWidgetEntry>) -> ()) {
		Task {
			do {
				let url = API.prefix + (configuration.repository ?? "")
				var repository = try await NetworkManager.shared.getRepo(url: url)
				let avatarData = try await NetworkManager.shared.downloadImageData(url: repository.owner.avatarUrl)
				repository.avatarData = avatarData
				
				let entry = SingleRepoWidgetEntry(date: .now, repository: repository)
				let nextUpdate = Date().addingTimeInterval(86400) // 24h
				let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
				completion(timeline)
			} catch {
				print("❌ error - \(error.localizedDescription)")
			}
		}
	}
}
