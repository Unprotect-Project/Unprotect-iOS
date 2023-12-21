import Foundation

public struct Results<Model: Codable>: Codable {
  public let count: Int
  public let next: URL?
  public let previous: URL?
  public let results: [Model]
  
  public init() {
    self.count = 0
    self.next = nil
    self.previous = nil
    self.results = []
  }
}
