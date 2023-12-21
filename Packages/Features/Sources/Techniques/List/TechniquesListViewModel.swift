import SwiftUI
import Models
import Networking
import Observation

@MainActor
@Observable class TechniquesListViewModel {
  enum State {
    case loading
    case error(error: Error)
    case data(techniques: [Technique], categories: [Categorie])
  }
  
  var state: State = .loading
  var searchText: String = ""
  
  init() { }
  
  func fetchData() async {
    async let techniques = fetchTechniques()
    async let categories = fetchCategories()
    self.state = await .data(techniques: techniques, categories: categories)
  }
  
  private func fetchTechniques() async -> [Technique] {
    do {
      let data: Results<Technique> = try await Networking.shared.fetch(endpoint: .techniques, page: 1)
      return data.results
    } catch {
      return []
    }
  }
  
  private func fetchCategories() async -> [Categorie] {
    do {
      let data: Results<Categorie> = try await Networking.shared.fetch(endpoint: .categories, page: 1)
      return data.results
    } catch {
      return []
    }
  }
}
