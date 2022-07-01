import Foundation

public struct DetectionRule: Codable, Hashable, Identifiable {
  public let id: Int
  public let name: String
  public let rule: String
  public let type: RuleType
  
  public struct RuleType: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: String
    public let syntaxLang: String
  }
}

let previewDetectionRule = DetectionRule(id: 0,
                                         name: "Rule",
                                         rule: "Rule first",
                                         type: .init(id: 0, name: "YARA", syntaxLang: "C"))
