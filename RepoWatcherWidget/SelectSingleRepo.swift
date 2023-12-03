//
//  SelectSingleRepo.swift
//  RepoWatcherWidgetExtension
//
//  Created by Alexander on 09.11.2023.
//

import AppIntents

struct SelectSingleRepo: AppIntent, WidgetConfigurationIntent, CustomIntentMigratedAppIntent {
	struct StringOptionsProvider: DynamicOptionsProvider {
		func results() async throws -> [String] {
			guard let repos = UserDefaults.shared.value(forKey: UserDefaults.repoKey) as? [String] else {
				throw UserDefaultsError.retrieval
			}
			
			return repos
		}
		
		func defaultResult() async -> String? {
			"aleks100s/darts"
		}
	}
	
	static let intentClassName = "SelectSignleRepoIntent"
	static let title: LocalizedStringResource = "Select Single Repo"
	static let description: IntentDescription? = "Select a repo to watch"
	
	@Parameter(title: "Repo", optionsProvider: StringOptionsProvider())
	var repository: String?
}
