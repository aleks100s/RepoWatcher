//
//  ContributorMediumView.swift
//  RepoWatcher
//
//  Created by Alexander on 30.10.2023.
//

import SwiftUI

struct ContributorMediumView: View {
	
	let repository: Repository
	
	var body: some View {
		VStack {
			HStack {
				Text("Top contributors")
					.font(.caption)
					.bold()
					.foregroundStyle(.secondary)
				Spacer()
			}
			
			LazyVGrid(
				columns: Array(repeating: GridItem(.flexible()), count: 2),
				alignment: .leading,
				spacing: 20
			) {
				ForEach(repository.contributors) { contributor in
					HStack {
						Image(uiImage: UIImage(data: contributor.avatarData) ?? .avatar)
							.resizable()
							.frame(width: 50, height: 50)
							.clipShape(Circle())
						
						VStack(alignment: .leading) {
							Text(contributor.login)
								.font(.caption)
								.minimumScaleFactor(0.6)
							Text("\(contributor.contributions)")
								.font(.caption2)
								.foregroundStyle(.secondary)
						}
					}
				}
			}
			
			if repository.contributors.count < 3 {
				Spacer()
			}
		}
	}
}

import WidgetKit

struct ContributorMediumViewPreview: PreviewProvider {
	static var previews: some View {
		ContributorMediumView(repository: .dummy1)
			.previewContext(WidgetPreviewContext(family: .systemMedium))
			.containerBackground(for: .widget) {
				Color.clear
			}
	}
}
