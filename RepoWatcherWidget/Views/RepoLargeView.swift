//
//  RepoLargeView.swift
//  RepoWatcherWidgetExtension
//
//  Created by Alexander on 29.10.2023.
//

import SwiftUI

struct RepoLargeView: View {
	let topRepository: Repository
	let bottomRepository: Repository
	
	var body: some View {
		VStack(spacing: 60) {
			RepoMediumView(repository: topRepository)
			RepoMediumView(repository: bottomRepository)
		}
	}
}

import WidgetKit

struct RepoLargeViewPreview: PreviewProvider {
	static var previews: some View {
		RepoLargeView(topRepository: .dummy1, bottomRepository: .dummy2)
			.previewContext(WidgetPreviewContext(family: .systemLarge))
			.containerBackground(for: .widget) {
				Color.clear
			}
	}
}
