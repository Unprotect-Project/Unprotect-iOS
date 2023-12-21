import SwiftUI
import DesignSystem
import Models

@MainActor
public struct SnippetDetailView: View {
  let snippet: Snippet
    
  public init(snippet: Snippet) {
    self.snippet = snippet
  }
  
  public var body: some View {
    ZStack {
      #if !os(visionOS)
      Color.uBackround.edgesIgnoringSafeArea(.all)
      #endif
      ScrollView {
        LazyVStack(alignment: .leading, spacing: 24) {
          descriptionSection
          snippetsSection
        }
        #if !os(visionOS)
        .background(Color.uBackround)
        #endif
      }
      .navigationBarTitleDisplayMode(.inline)
    }
  }
  
  @ViewBuilder
  private var descriptionSection: some View {
    makeSection(title: "Description")
    Text(snippet.description)
      .foregroundColor(.white)
      .font(.body)
      .padding(.horizontal, 12)
  }
  
  @ViewBuilder
  private var snippetsSection: some View {
    makeSection(title: "Snippets")
    
    Text(snippet.language.label)
      .padding(.horizontal, 12)

    ScrollView {
      Text(snippet.plainCode)
        .foregroundColor(.uCodeColor)
        .font(.body)
        .textSelection(.enabled)
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    #if os(visionOS)
    .background(Material.thick)
    #else
    .background(Color.uCodeBackground)
    #endif
    .cornerRadius(6)
    .padding(.horizontal, 12)
    .frame(maxHeight: 300)
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
    #if !os(visionOS)
    .background(Color.uLightBackground)
    #endif
  }
}

