import Foundation
import SwiftUI
import Models

struct BadgesView: View {
  let technique: Technique
  let size: Size
  
  enum Size {
    case small, expanded
  }
  
  var body: some View {
    ScrollView(.horizontal) {
      HStack(spacing: 8) {
        ForEach(technique.categories) { categorie in
          makeBadge(title: categorie.label, color: .uTechniques)
        }
        if !technique.snippets.isEmpty {
          makeBadge(title: "\(technique.snippets.count) Snippet(s)", color: .uSnippets)
        }
        if !technique.detectionRules.isEmpty {
          makeBadge(title: "\(technique.detectionRules.count) Rule(s)", color: .uRules)
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
  }
  
  private func makeBadge(title: String, color: Color) -> some View {
    Text(title)
      .font(.footnote)
      .padding(8)
      .background(color)
      .cornerRadius(8)
  }
}
