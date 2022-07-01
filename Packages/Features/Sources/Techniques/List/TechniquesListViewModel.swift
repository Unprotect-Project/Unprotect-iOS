import SwiftUI
import Models
import Networking

@MainActor
class TechniquesListViewModel: ObservableObject {
  enum State {
    case loading
    case error(error: Error)
    case data(techniques: Results<Technique>)
  }
  
  @Published var state: State = .loading
  @Published var searchText: String = ""
  
  init() { }
  
  func fetchTechniques() async {
    do {
      let data: Results<Technique> = try await Networking.shared.fetch(endpoint: .techniques, page: 1)
      self.state = .data(techniques: data)
    } catch let error {
      self.state = .error(error: error)
    }
  }
}
