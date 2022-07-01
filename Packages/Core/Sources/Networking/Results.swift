import Foundation

public struct Results<Model: Codable>: Codable {
  public let count: Int
  public let next: URL?
  public let previous: URL?
  public let results: [Model]
}
