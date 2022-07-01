import Foundation

public struct Technique: Codable, Identifiable, Hashable {
  public let id: Int
  public let name: String
  public let description: String
  public let categories: [Categorie]
  public let snippets: [Snippet]
  public let tags: String
  public let detectionRules: [DetectionRule]
}

public let previewTechnique = Technique(id: 0,
                                        name: "Technique preview",
                                        description: "Some description",
                                        categories: [previewCategorie],
                                        snippets: [previewSnippet],
                                        tags: "#preview",
                                        detectionRules: [previewDetectionRule])
