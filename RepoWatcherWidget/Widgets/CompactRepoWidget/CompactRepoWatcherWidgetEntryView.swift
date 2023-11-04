//
//  RepoWatcherWidgetEntryView.swift
//  RepoWatcherWidgetExtension
//
//  Created by Alexander on 29.10.2023.
//

import SwiftUI
import WidgetKit

struct CompactRepoWatcherWidgetEntryView: View {
	let entry: CompactRepoWidgetEntry
	
	@Environment(\.widgetFamily) var family
	
	var body: some View {
		switch family {
		case .systemMedium:
			RepoMediumView(repository: entry.topRepository)
			
		case .systemLarge:
			RepoLargeView(topRepository: entry.topRepository, bottomRepository: entry.bottomRepository!)
			
		case .accessoryCircular:
			ZStack {
				AccessoryWidgetBackground()
				VStack {
					Text("\(entry.topRepository.pushedAt.daysPassedUntilNow)")
						.font(.headline)
					Text("days")
						.font(.caption)
				}
			}
			
		case .accessoryInline:
			Text("\(entry.topRepository.name) - \(entry.topRepository.pushedAt.daysPassedUntilNow) days")

		case .accessoryRectangular:
			VStack(alignment: .leading) {
				Text(entry.topRepository.name)
					.font(.headline)
				Text("\(entry.topRepository.pushedAt.daysPassedUntilNow) days")
				
				HStack {
					Image(systemName: "star.fill")
						.resizable()
						.frame(width: 12, height: 12)
						.aspectRatio(contentMode: .fill)
					
					Text("\(entry.topRepository.watchers)")
					
					Image(systemName: "tuningfork")
						.resizable()
						.frame(width: 12, height: 12)
						.aspectRatio(contentMode: .fill)
					
					Text("\(entry.topRepository.forks)")
					
					if entry.topRepository.hasIssues {
						Image(systemName: "exclamationmark.triangle.fill")
							.resizable()
							.frame(width: 12, height: 12)
							.aspectRatio(contentMode: .fill)
						
						Text("\(entry.topRepository.openIssues)")
					}
				}
			}
			
		default:
			EmptyView()
		}
	}
}

import WidgetKit

struct CompactRepoWatcherWidgetEntryViewPreview: PreviewProvider {
	static var previews: some View {
		CompactRepoWatcherWidgetEntryView(entry: CompactRepoWidgetEntry(date: Date(), topRepository: .dummy1, bottomRepository: .dummy2))
			.previewContext(WidgetPreviewContext(family: .systemLarge))
			.containerBackground(for: .widget) {
				Color.clear
			}
	}
}
