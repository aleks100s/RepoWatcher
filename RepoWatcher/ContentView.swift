//
//  ContentView.swift
//  RepoWatcher
//
//  Created by Alexander on 29.10.2023.
//

import SwiftUI

struct ContentView: View {
	@State private var newRepo = ""
	@State private var repos: [String] = []

	var body: some View {
		NavigationStack {
			VStack {
				HStack {
					TextField("Ex. sallen0400/swift-news", text: $newRepo)
						.autocapitalization(.none)
						.autocorrectionDisabled()
						.textFieldStyle(.roundedBorder)

					Button {
						if !repos.contains(newRepo) && !newRepo.isEmpty {
							repos.append(newRepo)
							saveRepos()
							newRepo = ""
						}
					} label: {
						Image(systemName: "plus.circle.fill")
							.resizable()
							.frame(width: 30, height: 30)
							.foregroundColor(.green)
					}
				}
				.padding()

				VStack(alignment: .leading) {
					Text("Saved Repos")
						.font(.footnote)
						.foregroundColor(.secondary)
						.padding(.leading)

					List(repos, id: \.self) { repo in
						Text(repo)
							.swipeActions {
								Button("Delete") {
									repos.removeAll(where: { $0 == repo })
									saveRepos()
								}
								.tint(.red)
								.disabled(repos.isEmpty || repos.count == 1)
							}
					}
				}
			}
			.navigationTitle("Repo List")
			.onAppear {
				repos = UserDefaults.shared.value(forKey: UserDefaults.repoKey) as? [String] ?? ["sallen0400/swift-news"]
			}
		}
	}
	
	private func saveRepos() {
		UserDefaults.shared.set(repos, forKey: UserDefaults.repoKey)
	}
}

#Preview {
    ContentView()
}


//let rows = [
//	GridItem(.fixed(30), spacing: 1),
//	GridItem(.fixed(60), spacing: 10),
//	GridItem(.fixed(90), spacing: 20),
//	GridItem(.fixed(10), spacing: 50)
//]
//
//var body: some View {
//	ScrollView(.horizontal) {
//		LazyHGrid(rows: rows, spacing: 5) {
//			ForEach(0...300, id: \.self) { _ in
//				Color.red.frame(width: 30)
//				Color.green.frame(width: 10)
//				Color.blue.frame(width: 30)
//				Color.yellow.frame(width: 20)
//			}
//		}
//	}
//}
