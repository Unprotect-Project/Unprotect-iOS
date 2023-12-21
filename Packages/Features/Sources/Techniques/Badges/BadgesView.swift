import Foundation
import SwiftUI
import Models

struct BadgesView: View {
  let technique: Technique
  let categories: [Categorie]
  let size: Size
  
  enum Size {
    case small, expanded
  }
  
  var body: some View {
    ScrollView(.horizontal) {
      HStack(spacing: 8) {
        ForEach(technique.category, id: \.self) { category in
          if let category = categories.first(where: { $0.id == category }) {
            makeBadge(title: category.label, color: .uTechniques)
          }
        }
        if !technique.attachments.isEmpty {
          makeBadge(title: "\(technique.attachments.count) Attachment(s)", color: .uSnippets)
        }
        if !technique.rules.isEmpty {
          makeBadge(title: "\(technique.rules.count) Rule(s)", color: .uRules)
        }
        if size == .expanded {
          if !technique.tags.isEmpty {
            ForEach(technique.tags.components(separatedBy: " "), id: \.self) { tag in
              makeBadge(title: tag, color: .uContributors)
            }
          }
        }
      }
    }
    .scrollIndicators(.hidden)
    .scrollClipDisabled()
  }
  
  private func makeBadge(title: String, color: Color) -> some View {
    Text(title)
      .font(.footnote)
      .padding(8)
      .background(color)
      .cornerRadius(8)
  }
}
