//
//  RepoWatcherWidgetEntryView.swift
//  RepoWatcherWidgetExtension
//
//  Created by Alexander on 29.10.2023.
//

import SwiftUI
import WidgetKit

struct RepoWatcherWidgetEntryView: View {
	let entry: RepoEntry
	
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
