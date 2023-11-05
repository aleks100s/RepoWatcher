//
//  DoubleRepoWidget.swift
//  RepoWatcher
//
//  Created by Alexander on 05.11.2023.
//

import WidgetKit
import SwiftUI

struct DoubleRepoWatcherWidget: Widget {
	let kind: String = "DoubleRepoWatcherWidget"

	var body: some WidgetConfiguration {
		IntentConfiguration(kind: kind, intent: SelectTwoReposIntent.self, provider: DoubleRepoWidgetProvider()) { entry in
			DoubleRepoWatcherWidgetEntryView(entry: entry)
				.containerBackgroundForWidget {
					EmptyView()
				}
		}
		.configurationDisplayName("Double Repo Watcher")
		.description("This is an example widget.")
		.supportedFamilies([.systemLarge])
	}
}

#Preview(as: .systemMedium) {
	DoubleRepoWatcherWidget()
} timeline: {
	DoubleRepoWidgetEntry(date: .now, topRepository: .dummy1, bottomRepository: .dummy2)
}

#Preview(as: .systemLarge) {
	DoubleRepoWatcherWidget()
} timeline: {
	DoubleRepoWidgetEntry(date: .now, topRepository: .dummy1, bottomRepository: .dummy2)
}

#Preview(as: .accessoryInline) {
	DoubleRepoWatcherWidget()
} timeline: {
	DoubleRepoWidgetEntry(date: .now, topRepository: .dummy1, bottomRepository: .dummy2)
}

#Preview(as: .accessoryCircular) {
	DoubleRepoWatcherWidget()
} timeline: {
	DoubleRepoWidgetEntry(date: .now, topRepository: .dummy1, bottomRepository: .dummy2)
}

#Preview(as: .accessoryRectangular) {
	DoubleRepoWatcherWidget()
} timeline: {
	DoubleRepoWidgetEntry(date: .now, topRepository: .dummy1, bottomRepository: .dummy2)
}
