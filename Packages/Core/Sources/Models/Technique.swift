import Foundation

public struct Technique: Codable, Identifiable, Hashable {
  public let id: Int
  public let name: String
  public let description: String
  public let category: [Int]
  public let tags: String
  public let attachments: [String]
  public let rules: [Int]
}

public let previewTechnique = { Technique(id: Int.random(in: 0...100000),
                                          name: "Technique preview",
                                          description: "Some description",
                                          category: [0, 1, 2],
                                          tags: "#preview",
                                          attachments: [],
                                          rules: []) }
