import Foundation

// MARK: - NetworkServiceProtocol

protocol NetworkServiceProtocol {
	func request() async throws -> Data
	func decode<T: Codable>(from data: Data) throws -> T
}

// MARK: - NetworkError

enum NetworkError: Error {
	case badUrl
	case badRequest
	case badResponse
	case localized(description: String)
}

// MARK: - NetworkService

final class NetworkService: NetworkServiceProtocol {
	private let path: String
	private let cachePolicy: URLRequest.CachePolicy

	init(
		path: String,
		cachePolicy: URLRequest.CachePolicy
	) {
		self.path = path
		self.cachePolicy = cachePolicy
	}

	func request() async throws -> Data {
		guard let url = URL(string: path) else {
			throw NetworkError.badUrl
		}

		let request = URLRequest(
			url: url,
			cachePolicy: cachePolicy
		)

		let (data, response) = try await URLSession.shared.data(for: request)
		guard isValid(with: response) else {
			throw NetworkError.badResponse
		}
		return data
	}
	
	func decode<T: Codable>(from data: Data) throws -> T {
		let decoder = JSONDecoder()
		return try decoder.decode(T.self, from: data)
	}

	func isValid(with response: URLResponse) -> Bool {
		guard let response = response as? HTTPURLResponse else {
			return false
		}
		return response.statusCode ~= 200
	}
}
