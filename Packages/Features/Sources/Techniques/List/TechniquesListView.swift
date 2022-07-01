import SwiftUI
import DesignSystem

@available(iOS 16.0, *)
public struct TechniquesListView: View {
  @StateObject private var viewModel = TechniquesListViewModel()
  
  public init() { }
  
  public var body: some View {
    List {
      switch viewModel.state {
      case .loading:
        Text("Loading")
          .foregroundColor(.white)
          .listRowBackground(Color.uBackround)
      case let .error(error):
        Text(error.localizedDescription)
          .foregroundColor(.white)
          .listRowBackground(Color.uBackround)
      case let .data(techniques):
        ForEach(techniques.results) { technique in
          NavigationLink(value: technique) {
            TechniqueRowView(technique: technique)
          }
          .listRowBackground(Color.uBackround)
          .listRowSeparatorTint(Color.uSnippets)
          .listRowSeparator(.visible)
        }
      }
    }
    .searchable(text: $viewModel.searchText, prompt: "Search anything")
    .listStyle(.plain)
    .background(Color.uBackround)
    .navigationTitle("Unprotect")
    .task {
      await viewModel.fetchTechniques()
    }
  }
}

@available(iOS 16.0, *)
struct TechniquesListView_Previews: PreviewProvider {
  static var previews: some View {
    TechniquesListView()
  }
}

