import Foundation
import SwiftUI

public struct Snippet: Codable, Hashable, Identifiable {
  public let id: Int
  public let plainCode: String
  public let language: Language
  public let technique: URL
  public let description: String
}
