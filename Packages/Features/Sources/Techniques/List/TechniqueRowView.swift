import SwiftUI
import Models
import DesignSystem

@available(iOS 16.0, *)
struct TechniqueRowView: View {
  let technique: Technique
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text(technique.name)
        .font(.headline)
        .fontWeight(.bold)
      Text(technique.description)
        .font(.body)
        .lineLimit(2)
      BadgesView(technique: technique, size: .small)
    }
  }
}

@available(iOS 16.0, *)
struct TechniqueRowView_Previews: PreviewProvider {
  static var previews: some View {
    List {
      TechniqueRowView(technique: previewTechnique)
      TechniqueRowView(technique: previewTechnique)
      TechniqueRowView(technique: previewTechnique)
    }.preferredColorScheme(.dark)
  }
}
