//
//  IntentHandler.swift
//  RepoWatcherIntents
//
//  Created by Alexander on 05.11.2023.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}

extension IntentHandler: SelectSingleRepoIntentHandling {
	func provideRepositoryOptionsCollection(for intent: SelectSingleRepoIntent) async throws -> INObjectCollection<NSString> {
		guard let repos = UserDefaults.shared.value(forKey: UserDefaults.repoKey) as? [NSString] else {
			throw UserDefaultsError.retrieval
		}
		
		return INObjectCollection(items: repos)
	}
	
	func defaultRepository(for intent: SelectSingleRepoIntent) -> String? {
		"aleks100s/darts"
	}
}

extension IntentHandler: SelectTwoReposIntentHandling {
	func provideTopRepositoryOptionsCollection(for intent: SelectTwoReposIntent) async throws -> INObjectCollection<NSString> {
		guard let repos = UserDefaults.shared.value(forKey: UserDefaults.repoKey) as? [NSString] else {
			throw UserDefaultsError.retrieval
		}
		
		return INObjectCollection(items: repos)
	}
	
	func provideBottomRepositoryOptionsCollection(for intent: SelectTwoReposIntent) async throws -> INObjectCollection<NSString> {
		guard let repos = UserDefaults.shared.value(forKey: UserDefaults.repoKey) as? [NSString] else {
			throw UserDefaultsError.retrieval
		}
		
		return INObjectCollection(items: repos)
	}
	
	func defaultTopRepository(for intent: SelectTwoReposIntent) -> String? {
		"aleks100s/darts"
	}
	
	func defaultBottomRepository(for intent: SelectTwoReposIntent) -> String? {
		"aleks100s/darts"
	}
}
