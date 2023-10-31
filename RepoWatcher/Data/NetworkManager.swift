//
//  NetworkManager.swift
//  RepoWatcher
//
//  Created by Alexander on 29.10.2023.
//

import Foundation

final class NetworkManager {
	static let shared = NetworkManager()
	
	private let decoder = JSONDecoder()
	
	private init() {
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		decoder.dateDecodingStrategy = .iso8601
	}
	
	func getRepo(url: String) async throws -> Repository {
		let data = try await fetchData(from: url)
		let dto = try decoder.decode(RepositoryDTO.self, from: data)
		let repository = Repository(dto: dto)
		return repository
	}
	
	func getContributors(url: String) async throws -> [Contributor] {
		let data = try await fetchData(from: url)
		let dtos = try decoder.decode([ContributorDTO].self, from: data)
		let contributors = dtos.map { Contributor(dto: $0) }
		return contributors
	}
	
	func downloadImageData(url: String) async throws -> Data {
		try await fetchData(from: url)
	}
	
	private func fetchData(from url: String) async throws -> Data {
		guard let url = URL(string: url) else {
			throw CustomError.urlError
		}
		
		let request = URLRequest(url: url)
		let (data, _) = try await URLSession.shared.data(for: request)
		return data
	}
}
