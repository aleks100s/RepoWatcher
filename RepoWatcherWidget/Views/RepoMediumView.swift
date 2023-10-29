//
//  RepoMediumView.swift
//  RepoWatcherWidgetExtension
//
//  Created by Alexander on 29.10.2023.
//

import SwiftUI

struct RepoMediumView: View {
	let repository: Repository

	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				HStack {
					Image(uiImage: UIImage(data: repository.avatarData) ?? .avatar)
						.resizable()
						.frame(width: 50, height: 50)
						.clipShape(Circle())
					
					Text(repository.name)
						.font(.title2)
						.fontWeight(.bold)
						.minimumScaleFactor(0.6)
						.lineLimit(1)
				}
				.padding(.bottom, 6)
				
				HStack {
					StatLabel(value: repository.watchers, systemImageName: "star.fill")
					
					StatLabel(value: repository.forks, systemImageName: "tuningfork")
					
					if repository.hasIssues {
						StatLabel(value: repository.openIssues, systemImageName: "exclamationmark.triangle.fill")
					}
				}
			}
			
			Spacer()
			
			VStack {
				Text("\(repository.pushedAt.daysPassedUntilNow)")
					.font(.system(size: 64))
					.bold()
					.foregroundStyle(.green)
					.frame(width: 90)
					.minimumScaleFactor(0.6)
					.lineLimit(1)
				
				Text("days ago")
					.font(.caption2)
					.foregroundStyle(.secondary)
			}
		}
	}
}

import WidgetKit

struct RepoMediumViewPreview: PreviewProvider {
	static var previews: some View {
		RepoMediumView(repository: .dummy1)
			.previewContext(WidgetPreviewContext(family: .systemMedium))
			.containerBackground(for: .widget) {
				Color.clear
			}
	}
}
