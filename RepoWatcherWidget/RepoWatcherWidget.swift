//
//  RepoWatcherWidget.swift
//  RepoWatcherWidget
//
//  Created by Alexander on 29.10.2023.
//

import WidgetKit
import SwiftUI

struct RepoWatcherWidget: Widget {
    let kind: String = "RepoWatcherWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
			RepoWatcherWidgetEntryView(entry: entry)
				.containerBackgroundForWidget {
					EmptyView()
				}
        }
        .configurationDisplayName("Repo Watcher")
        .description("This is an example widget.")
		.supportedFamilies([.systemMedium, .systemLarge])
    }
}

#Preview(as: .systemMedium) {
    RepoWatcherWidget()
} timeline: {
	RepoEntry(date: .now, topRepository: .dummy1, bottomRepository: .dummy2)
}

#Preview(as: .systemLarge) {
	RepoWatcherWidget()
} timeline: {
	RepoEntry(date: .now, topRepository: .dummy1, bottomRepository: .dummy2)
}
