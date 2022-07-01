import Foundation
import SwiftUI

public struct Snippet: Codable, Hashable, Identifiable {
  public let id: Int
  public let plainCode: String
  public let language: Language
}

let previewSnippet = Snippet(id: 0, plainCode: "some code \n some more code", language: previewLanguage)
