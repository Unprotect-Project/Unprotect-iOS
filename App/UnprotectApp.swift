import DesignSystem
import Models
import SwiftUI
import Techniques
import Snippets

@main
@MainActor struct UnprotectApp: App {
  var body: some Scene {
    WindowGroup {
      TabView {
        techniqueTab.tabItem {
          Label("Techniques", systemImage: "aqi.medium")
        }
        
        snippetsTab.tabItem {
          Label("Snippets", systemImage: "cube")
        }
        
      }
      .preferredColorScheme(.dark)
    }
  }
  
  private var techniqueTab: some View {
    NavigationStack {
      TechniquesListView()
        .navigationDestination(for: Technique.self) { technique in
          TechniqueDetailView(technique: technique)
        }
      .toolbarBackground(Color.uSecondaryBackground.opacity(0.50), for: .navigationBar)
    }
    .toolbarBackground(Color.uSecondaryBackground.opacity(0.50), for: .tabBar)
  }
  
  private var snippetsTab: some View {
    NavigationStack {
      SnippetsListView()
        .navigationDestination(for: Snippet.self) { snippet in
          SnippetDetailView(snippet: snippet)
        }
      .toolbarBackground(Color.uSecondaryBackground.opacity(0.50), for: .navigationBar)
    }
    .toolbarBackground(Color.uSecondaryBackground.opacity(0.50), for: .tabBar)
  }
}
