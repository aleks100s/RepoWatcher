//
//  RepoWatcherWidgetBundle.swift
//  RepoWatcherWidget
//
//  Created by Alexander on 29.10.2023.
//

import WidgetKit
import SwiftUI

@main
struct RepoWatcherWidgetBundle: WidgetBundle {
    var body: some Widget {
        CompactRepoWatcherWidget()
		ContributorWidget()
    }
}
