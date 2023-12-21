import SwiftUI
import DesignSystem
import Networking
import Models

@MainActor
public struct SnippetsListView: View {
  @State private var snippets: [Snippet] = []
  
  public init() { }
  
  public var body: some View {
    List(snippets) { snippet in
      if snippets.isEmpty {
        ProgressView()
          #if !os(visionOS)
          .listRowBackground(Color.uBackround)
          #endif
      } else {
        NavigationLink(value: snippet) {
          Text(snippet.description).lineLimit(2)
        }
        #if !os(visionOS)
        .listRowBackground(Color.uBackround)
        #endif
      }
    }.task {
      do {
        let snippets: Results<Snippet> = try await Networking.shared.fetch(endpoint: .snippets, page: 1)
        self.snippets = snippets.results
      } catch { }
    }
    #if os(visionOS)
    .listStyle(.grouped)
    #else
    .listStyle(.plain)
    .background(Color.uBackround)
    #endif
    .navigationTitle("Snippets")
  }
}

#Preview {
  SnippetsListView()
}
