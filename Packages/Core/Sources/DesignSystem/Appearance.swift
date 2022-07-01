import SwiftUI
import UIKit

public struct Appearance {
  public static func setup() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithTransparentBackground()
    appearance.backgroundColor = UIColor(Color.uSecondaryBackground)
    appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
    UINavigationBar.appearance().standardAppearance = appearance
    UINavigationBar.appearance().tintColor = .white
    
    UICollectionView.appearance().backgroundColor = UIColor(Color.uBackround)
    UITableView.appearance().backgroundColor = UIColor(Color.uBackround)
  }
}
