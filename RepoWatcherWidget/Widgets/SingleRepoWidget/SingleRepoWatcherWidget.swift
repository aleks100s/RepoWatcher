//
//  RepoWatcherWidget.swift
//  RepoWatcherWidget
//
//  Created by Alexander on 29.10.2023.
//

import WidgetKit
import SwiftUI

struct SingleRepoWatcherWidget: Widget {
    let kind: String = "SingleRepoWatcherWidget"

    var body: some WidgetConfiguration {
		AppIntentConfiguration(kind: kind, intent: SelectSingleRepo.self, provider: SingleRepoWidgetProvider()) { entry in
			SingleRepoWatcherWidgetEntryView(entry: entry)
				.containerBackgroundForWidget {}
        }
        .configurationDisplayName("Single Repo Watcher")
        .description("This is an example widget.")
		.supportedFamilies(
			[
				.systemMedium,
				.accessoryInline,
				.accessoryCircular,
				.accessoryRectangular
			]
		)
    }
}

#Preview(as: .systemMedium) {
	SingleRepoWatcherWidget()
} timeline: {
	SingleRepoWidgetEntry(date: .now, repository: .dummy1)
	SingleRepoWidgetEntry(date: .now, repository: .dummy2)
}

#Preview(as: .systemLarge) {
	SingleRepoWatcherWidget()
} timeline: {
	SingleRepoWidgetEntry(date: .now, repository: .dummy1)
	SingleRepoWidgetEntry(date: .now, repository: .dummy2)
}

#Preview(as: .accessoryInline) {
	SingleRepoWatcherWidget()
} timeline: {
	SingleRepoWidgetEntry(date: .now, repository: .dummy1)
}

#Preview(as: .accessoryCircular) {
	SingleRepoWatcherWidget()
} timeline: {
	SingleRepoWidgetEntry(date: .now, repository: .dummy1)
}

#Preview(as: .accessoryRectangular) {
	SingleRepoWatcherWidget()
} timeline: {
	SingleRepoWidgetEntry(date: .now, repository: .dummy1)
}
