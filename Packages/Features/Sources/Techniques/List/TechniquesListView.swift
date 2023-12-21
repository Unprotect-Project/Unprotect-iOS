import SwiftUI
import DesignSystem
import Networking
import Models

public struct TechniquesListView: View {
  @Environment(Networking.self) private var networking
  
  enum ViewState {
    case loading
    case error(error: Error)
    case data(techniques: [Technique], categories: [Categorie], haveNextPage: Bool)
  }
  
  @State private var state: ViewState = .loading
  @State private var searchText: String = ""
  @State private var page: Int = 1
  
  public init() { }
  
  public var body: some View {
    List {
      switch state {
      case .loading:
        loadingView
      case let .error(error):
        Text(error.localizedDescription)
          .foregroundColor(.white)
          #if !os(visionOS)
          .listRowBackground(Color.uBackround)
          #endif
      case let .data(techniques, categories, _):
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
        nextPageView
      }
    }
    .searchable(text: $searchText, prompt: "Search anything")
    #if os(visionOS)
    .listStyle(.grouped)
    #else
    .listStyle(.plain)
    .background(Color.uBackround)
    #endif
    .navigationTitle("Unprotect")
    .task {
      await fetchData()
    }
    .task(id: searchText) {
      guard !searchText.isEmpty else { return }
      // TODO: Search
    }
  }
  
  private var loadingView: some View {
    ForEach([previewTechnique(), previewTechnique(), previewTechnique()]) { technique in
      TechniqueRowView(technique: technique, categories: [])
        .redacted(reason: .placeholder)
        #if !os(visionOS)
        .listRowBackground(Color.uBackround)
        .listRowSeparatorTint(Color.uSnippets)
        .listRowSeparator(.visible)
        #endif
    }
  }
  
  @ViewBuilder
  private var nextPageView: some View {
    switch state {
    case .loading:
      EmptyView()
    case .error:
      EmptyView()
    case .data(let techniques, let categories, let haveNextPage):
      if haveNextPage {
        ProgressView()
          #if !os(visionOS)
          .listRowBackground(Color.uBackround)
          #endif
          .onAppear {
            page += 1
            Task {
              let newPage = await fetchTechniques()
              var techniques = techniques
              techniques.append(contentsOf: newPage.results)
              state = .data(techniques: techniques,
                            categories: categories,
                            haveNextPage: newPage.next != nil)
            }
          }
      }
    }
  }
  
  private func fetchData() async {
    async let techniques = fetchTechniques()
    async let categories = fetchCategories()
    self.state = await .data(techniques: techniques.results,
                             categories: categories,
                             haveNextPage: techniques.next != nil)
  }
  
  private func fetchTechniques() async -> Results<Technique> {
    do {
      return try await networking.fetch(endpoint: .techniques,
                                          page: page)
    } catch {
      return .init()
    }
  }
  
  private func fetchCategories() async -> [Categorie] {
    do {
      let data: Results<Categorie> = try await networking.fetch(endpoint: .categories,
                                                                page: page)
      return data.results
    } catch {
      return []
    }
  }
}

#Preview {
  TechniquesListView()
}

