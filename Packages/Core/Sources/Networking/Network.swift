import Foundation

public struct Networking {
  public enum Endpoint: String {
    case techniques, categories, snippets
    case detectionRules = "detection_rules"
    case snippetAuthors = "snippet_authors"
  }
  
  static public let shared = Networking()
  
  private let jsonDecoder = JSONDecoder()
  
  private init() {
    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
  }
  
  private func makeURL(endpoint: Endpoint, page: Int?) -> URL {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "unprotect.it"
    components.path = "/api/\(endpoint.rawValue).json"
    if let page {
      components.queryItems = [
        URLQueryItem(name: "page", value: String(page))
      ]
    }
    return components.url!
  }
  
  public func fetch<Result: Codable>(endpoint: Endpoint, page: Int?) async throws -> Result {
    let request = URLRequest(url: makeURL(endpoint: endpoint, page: page))
    let data = try await URLSession.shared.data(for: request).0
    return try jsonDecoder.decode(Result.self, from: data)
  }
}
