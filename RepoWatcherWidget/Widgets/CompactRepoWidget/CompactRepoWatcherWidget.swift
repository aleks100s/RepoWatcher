//
//  RepoWatcherWidget.swift
//  RepoWatcherWidget
//
//  Created by Alexander on 29.10.2023.
//

import WidgetKit
import SwiftUI

struct CompactRepoWatcherWidget: Widget {
    let kind: String = "CompactRepoWatcherWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CompactRepoWidgetProvider()) { entry in
			CompactRepoWatcherWidgetEntryView(entry: entry)
				.containerBackgroundForWidget {
					EmptyView()
				}
        }
        .configurationDisplayName("Repo Watcher")
        .description("This is an example widget.")
		.supportedFamilies(
			[
				.systemMedium,
				.systemLarge,
				.accessoryInline,
				.accessoryCircular,
				.accessoryRectangular
			]
		)
    }
}

#Preview(as: .systemMedium) {
    CompactRepoWatcherWidget()
} timeline: {
	CompactRepoWidgetEntry(date: .now, topRepository: .dummy1, bottomRepository: .dummy2)
}

#Preview(as: .systemLarge) {
	CompactRepoWatcherWidget()
} timeline: {
	CompactRepoWidgetEntry(date: .now, topRepository: .dummy1, bottomRepository: .dummy2)
}

#Preview(as: .accessoryInline) {
	CompactRepoWatcherWidget()
} timeline: {
	CompactRepoWidgetEntry(date: .now, topRepository: .dummy1, bottomRepository: .dummy2)
}

#Preview(as: .accessoryCircular) {
	CompactRepoWatcherWidget()
} timeline: {
	CompactRepoWidgetEntry(date: .now, topRepository: .dummy1, bottomRepository: .dummy2)
}

#Preview(as: .accessoryRectangular) {
	CompactRepoWatcherWidget()
} timeline: {
	CompactRepoWidgetEntry(date: .now, topRepository: .dummy1, bottomRepository: .dummy2)
}
