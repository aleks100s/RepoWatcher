//
//  StatLabel.swift
//  RepoWatcherWidgetExtension
//
//  Created by Alexander on 29.10.2023.
//

import SwiftUI

struct StatLabel: View {
	let value: Int
	let systemImageName: String
	
	var body: some View {
		Label(
			title: {
				Text("\(value)")
					.font(.footnote)
			},
			icon: {
				Image(systemName: systemImageName)
					.foregroundStyle(.green)
			}
		)
	}
}

import WidgetKit

struct StatLabelPreview: PreviewProvider {
	static var previews: some View {
		StatLabel(value: 123, systemImageName: "star.fill")
			.previewContext(WidgetPreviewContext(family: .systemMedium))
			.containerBackground(for: .widget) {
				Color.white
			}
	}
}
