//
//  RepoWatcherWidgetEntryView.swift
//  RepoWatcherWidgetExtension
//
//  Created by Alexander on 29.10.2023.
//

import SwiftUI
import WidgetKit

struct SingleRepoWatcherWidgetEntryView: View {
	let entry: SingleRepoWidgetEntry
	
	@Environment(\.widgetFamily) var family
	
	var body: some View {
		switch family {
		case .systemMedium:
			RepoMediumView(repository: entry.repository)
			
		case .accessoryCircular:
			ZStack {
				AccessoryWidgetBackground()
				VStack {
					Text("\(entry.repository.pushedAt.daysPassedUntilNow)")
						.font(.headline)
					Text("days")
						.font(.caption)
				}
			}
			
		case .accessoryInline:
			Text("\(entry.repository.name) - \(entry.repository.pushedAt.daysPassedUntilNow) days")

		case .accessoryRectangular:
			VStack(alignment: .leading) {
				Text(entry.repository.name)
					.font(.headline)
				Text("\(entry.repository.pushedAt.daysPassedUntilNow) days")
				
				HStack {
					Image(systemName: "star.fill")
						.resizable()
						.frame(width: 12, height: 12)
						.aspectRatio(contentMode: .fill)
					
					Text("\(entry.repository.watchers)")
					
					Image(systemName: "tuningfork")
						.resizable()
						.frame(width: 12, height: 12)
						.aspectRatio(contentMode: .fill)
					
					Text("\(entry.repository.forks)")
					
					if entry.repository.hasIssues {
						Image(systemName: "exclamationmark.triangle.fill")
							.resizable()
							.frame(width: 12, height: 12)
							.aspectRatio(contentMode: .fill)
						
						Text("\(entry.repository.openIssues)")
					}
				}
			}
			
		default:
			EmptyView()
		}
	}
}

import WidgetKit

struct SingleRepoWatcherWidgetEntryViewPreview: PreviewProvider {
	static var previews: some View {
		SingleRepoWatcherWidgetEntryView(entry: SingleRepoWidgetEntry(date: Date(), repository: .dummy1))
			.previewContext(WidgetPreviewContext(family: .systemLarge))
			.containerBackground(for: .widget) {
				Color.clear
			}
	}
}
