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
