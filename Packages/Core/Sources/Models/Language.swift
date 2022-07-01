import Foundation
import SwiftUI

public struct Language: Codable, Identifiable, Hashable {
  public let id: Int
  public let label: String
  public let codeClass: String
}

public let previewLanguage = Language(id: 0, label: "C++", codeClass: "CPP")
