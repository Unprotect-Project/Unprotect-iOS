import Foundation

public struct Categorie: Codable, Identifiable, Hashable {
  public let id: Int
  public let key: String
  public let label: String
}

public let previewCategorie = Categorie(id: 0, key: "Categories", label: "Categorie")
