//
//  Provider.swift
//  RepoWatcher
//
//  Created by Alexander on 29.10.2023.
//

import WidgetKit

struct Provider: TimelineProvider {
	func placeholder(in context: Context) -> RepoEntry {
		RepoEntry(date: Date(), topRepository: .dummy1, bottomRepository: .dummy2)
	}

	func getSnapshot(in context: Context, completion: @escaping (RepoEntry) -> ()) {
		let entry = RepoEntry(date: Date(), topRepository: .dummy1, bottomRepository: .dummy2)
		completion(entry)
	}

	func getTimeline(in context: Context, completion: @escaping (Timeline<RepoEntry>) -> ()) {
		Task {
			do {
				var topRepository = try await NetworkManager.shared.getRepo(url: API.swiftNews.rawValue)
				let topAvatarData = try await NetworkManager.shared.downloadImageData(url: topRepository.owner.avatarUrl)
				topRepository.avatarData = topAvatarData
				
				var bottomRepository: Repository?
				if context.family == .systemLarge {
					bottomRepository = try await NetworkManager.shared.getRepo(url: API.google.rawValue)
					let bottomAvatarData = try await NetworkManager.shared.downloadImageData(url: bottomRepository?.owner.avatarUrl ?? "")
					bottomRepository?.avatarData = bottomAvatarData 
				}
				
				let entry = RepoEntry(date: .now, topRepository: topRepository, bottomRepository: bottomRepository)
				let nextUpdate = Date().addingTimeInterval(86400) // 24h
				let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
				completion(timeline)
			} catch {
				print("❌ error - \(error.localizedDescription)")
			}
		}
	}
}
