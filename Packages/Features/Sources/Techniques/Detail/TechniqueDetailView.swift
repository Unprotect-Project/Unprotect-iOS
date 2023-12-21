import SwiftUI
import DesignSystem
import Models

public struct TechniqueDetailView: View {
  let technique: Technique
  
  @State private var selectedSnippet: Int
  @State private var selectedRule: Int
  
  public init(technique: Technique) {
    self.technique = technique
    self.selectedSnippet = 0
    self.selectedRule = 0
  }
  
  public var body: some View {
    ZStack {
      Color.uBackround.edgesIgnoringSafeArea(.all)
      ScrollView {
        LazyVStack(alignment: .leading, spacing: 24) {
          descriptionSection
          /*
          if !technique.snippets.isEmpty {
            snippetsSection
          }
          if !technique.detectionRules.isEmpty {
            rulesSection
          }
           */
          infoSection
        }
        .background(Color.uBackround)
      }
      .navigationTitle(technique.name)
      .navigationBarTitleDisplayMode(.inline)
    }
  }
  
  @ViewBuilder
  private var descriptionSection: some View {
    makeSection(title: "Description")
    Text(technique.description)
      .foregroundColor(.white)
      .font(.body)
      .padding(.horizontal, 12)
  }
  
  @ViewBuilder
  private var infoSection: some View {
    makeSection(title: "Info")
    BadgesView(technique: technique, categories: [], size: .expanded)
      .padding(.horizontal, 12)
  }
  
  @ViewBuilder
  private var snippetsSection: some View {
    makeSection(title: "Snippets")
    
    /*
    Picker("Language", selection: $selectedSnippet) {
      ForEach(technique.snippets) { snippet in
        Text(snippet.language.label)
          .tag(snippet.id)
      }
    }
    .pickerStyle(.segmented)
    .padding(.horizontal, 12)
     */

    /*
    ScrollView {
      Text(technique.snippets.first{ $0.id == selectedSnippet }?.plainCode ?? "")
        .foregroundColor(.uCodeColor)
        .font(.body)
        .textSelection(.enabled)
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .background(Color.uCodeBackground)
    .cornerRadius(6)
    .padding(.horizontal, 12)
    .frame(maxHeight: 300)
     */
  }
  
  
  @ViewBuilder
  private var rulesSection: some View {
    makeSection(title: "Detection Rules")
    
    /*
    Picker("Detection Rules", selection: $selectedRule) {
      ForEach(technique.detectionRules) { rule in
        Text(rule.type.name)
          .tag(rule.id)
      }
    }
    .pickerStyle(.segmented)
    .padding(.horizontal, 12)
     

    ScrollView {
      Text(technique.detectionRules.first{ $0.id == selectedRule }?.rule ?? "")
        .foregroundColor(.uCodeColor)
        .font(.body)
        .textSelection(.enabled)
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .background(Color.uCodeBackground)
    .cornerRadius(6)
    .padding(.horizontal, 12)
    .frame(maxHeight: 300)
     */
  }
  
  private func makeSection(title: String) -> some View {
    HStack {
      Text(title)
        .font(.headline)
        .fontWeight(.bold)
        .padding(12)
      Spacer()
    }
    .foregroundColor(.white)
    .background(Color.uLightBackground)
  }
}

#Preview {
  TechniqueDetailView(technique: previewTechnique)
}


