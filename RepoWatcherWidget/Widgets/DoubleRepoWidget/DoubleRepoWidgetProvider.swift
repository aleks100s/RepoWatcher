//
//  DoubleRepoWidgetProvider.swift
//  RepoWatcher
//
//  Created by Alexander on 05.11.2023.
//

import WidgetKit

struct DoubleRepoWidgetProvider: TimelineProvider {
	func placeholder(in context: Context) -> DoubleRepoWidgetEntry {
		DoubleRepoWidgetEntry(date: Date(), topRepository: .dummy1, bottomRepository: .dummy2)
	}

	func getSnapshot(in context: Context, completion: @escaping (DoubleRepoWidgetEntry) -> ()) {
		let entry = DoubleRepoWidgetEntry(date: Date(), topRepository: .dummy1, bottomRepository: .dummy2)
		completion(entry)
	}

	func getTimeline(in context: Context, completion: @escaping (Timeline<DoubleRepoWidgetEntry>) -> ()) {
		Task {
			do {
				var topRepository = try await NetworkManager.shared.getRepo(url: API.swiftNews.rawValue)
				let topAvatarData = try await NetworkManager.shared.downloadImageData(url: topRepository.owner.avatarUrl)
				topRepository.avatarData = topAvatarData
				
				var bottomRepository = try await NetworkManager.shared.getRepo(url: API.google.rawValue)
				let bottomAvatarData = try await NetworkManager.shared.downloadImageData(url: bottomRepository.owner.avatarUrl)
				bottomRepository.avatarData = bottomAvatarData
				
				let entry = DoubleRepoWidgetEntry(date: .now, topRepository: topRepository, bottomRepository: bottomRepository)
				let nextUpdate = Date().addingTimeInterval(86400) // 24h
				let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
				completion(timeline)
			} catch {
				print("❌ error - \(error.localizedDescription)")
			}
		}
	}
}
