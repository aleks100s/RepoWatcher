//
//  ContributorWidgetEntryView.swift
//  RepoWatcher
//
//  Created by Alexander on 30.10.2023.
//

import SwiftUI

struct ContributorWidgetEntryView: View {
	let entry: ContributorWidgetEntry
	
	var body: some View {
		VStack(spacing: 40) {
			RepoMediumView(repository: entry.repository)
			
			ContributorMediumView(repository: entry.repository)
		}
	}
}

import WidgetKit

struct ContributorWidgetEntryViewPreview: PreviewProvider {
	static var previews: some View {
		ContributorWidgetEntryView(entry: ContributorWidgetEntry(date: Date(), repository: .dummy1))
			.previewContext(WidgetPreviewContext(family: .systemLarge))
			.containerBackground(for: .widget) {
				Color.clear
			}
	}
}
