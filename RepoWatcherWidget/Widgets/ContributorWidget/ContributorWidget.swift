//
//  ContributorWidget.swift
//  RepoWatcher
//
//  Created by Alexander on 30.10.2023.
//

import WidgetKit
import SwiftUI

struct ContributorWidget: Widget {
	let kind: String = "ContributorWidget"

	var body: some WidgetConfiguration {
		StaticConfiguration(kind: kind, provider: ContributorWidgetProvider()) { entry in
			ContributorWidgetEntryView(entry: entry)
				.containerBackgroundForWidget {
					EmptyView()
				}
		}
		.configurationDisplayName("Contributor Widget")
		.description("This is an example widget.")
		.supportedFamilies([.systemLarge])
	}
}

#Preview(as: .systemLarge) {
	ContributorWidget()
} timeline: {
	ContributorWidgetEntry(date: .now, repository: .dummy1)
}

#Preview(as: .systemLarge) {
	ContributorWidget()
} timeline: {
	ContributorWidgetEntry(date: .now, repository: .dummy1)
}
