import SwiftUI
import Models
import DesignSystem

@available(iOS 16.0, *)
struct TechniqueRowView: View {
  let technique: Technique
  let categories: [Categorie]
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text(technique.name)
        .font(.headline)
        .fontWeight(.bold)
      Text(technique.description)
        .font(.body)
        .lineLimit(2)
      BadgesView(technique: technique, categories: categories, size: .small)
    }
  }
}

#Preview {
  List {
    TechniqueRowView(technique: previewTechnique(), categories: [])
    TechniqueRowView(technique: previewTechnique(), categories: [])
    TechniqueRowView(technique: previewTechnique(), categories: [])
  }.preferredColorScheme(.dark)
}
