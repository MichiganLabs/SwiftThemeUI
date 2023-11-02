import Foundation
import SwiftUI

public struct ThemeModifierKey: EnvironmentKey {
  public static var defaultValue: GeneratedThemeType? = nil
}

public extension EnvironmentValues {
  /// Computed variable used for accessing the environment's currently selected Theme
  var currentTheme: ThemeModifierKey.Value {
    get { self[ThemeModifierKey.self] }
    set { self[ThemeModifierKey.self] = newValue }
  }
}
