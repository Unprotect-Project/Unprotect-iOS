import SwiftUI
import DesignSystem

@MainActor
public struct TechniquesListView: View {
  @State private var viewModel = TechniquesListViewModel()
  
  public init() { }
  
  public var body: some View {
    List {
      switch viewModel.state {
      case .loading:
        ProgressView()
        #if !os(visionOS)
        .listRowBackground(Color.uBackround)
        #endif
      case let .error(error):
        Text(error.localizedDescription)
          .foregroundColor(.white)
          #if !os(visionOS)
          .listRowBackground(Color.uBackround)
          #endif
      case let .data(techniques, categories):
        ForEach(techniques) { technique in
          NavigationLink(value: technique) {
            TechniqueRowView(technique: technique, categories: categories)
          }
          #if !os(visionOS)
          .listRowBackground(Color.uBackround)
          .listRowSeparatorTint(Color.uSnippets)
          .listRowSeparator(.visible)
          #endif
        }
      }
    }
    .searchable(text: $viewModel.searchText, prompt: "Search anything")
    #if os(visionOS)
    .listStyle(.grouped)
    #else
    .listStyle(.plain)
    .background(Color.uBackround)
    #endif
    .navigationTitle("Unprotect")
    .task {
      await viewModel.fetchData()
    }
  }
}

#Preview {
  TechniquesListView()
}

