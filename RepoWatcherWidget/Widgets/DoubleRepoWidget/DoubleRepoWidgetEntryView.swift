//
//  DoubleRepoWidgetEntryView.swift
//  RepoWatcher
//
//  Created by Alexander on 05.11.2023.
//

import SwiftUI
import WidgetKit

struct DoubleRepoWatcherWidgetEntryView: View {
	let entry: DoubleRepoWidgetEntry
		
	var body: some View {
		RepoLargeView(
			topRepository: entry.topRepository,
			bottomRepository: entry.bottomRepository
		)
	}
}

import WidgetKit

struct DoubleRepoWatcherWidgetEntryViewPreview: PreviewProvider {
	static var previews: some View {
		DoubleRepoWatcherWidgetEntryView(entry: DoubleRepoWidgetEntry(date: Date(), topRepository: .dummy1, bottomRepository: .dummy2))
			.previewContext(WidgetPreviewContext(family: .systemLarge))
			.containerBackground(for: .widget) {
				Color.clear
			}
	}
}
