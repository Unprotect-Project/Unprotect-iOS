import SwiftUI
import Techniques
import DesignSystem
import Models

@main
struct UnprotectApp: App {
  init() {
    Appearance.setup()
  }
  
  var body: some Scene {
    WindowGroup {
      NavigationStack {
        ZStack {
          TechniquesListView()
            .navigationDestination(for: Technique.self) { technique in
             TechniqueDetailView(technique: technique)
            }
        }
      }
      .preferredColorScheme(.dark)
    }
  }
}
