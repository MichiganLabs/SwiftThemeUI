import Foundation
import SwiftUI

struct ThemeModifierKey: EnvironmentKey {
  static var defaultValue: GeneratedThemeType? = nil
}

extension EnvironmentValues {
  /// Computed variable used for accessing the environment's currently selected Theme
  var currentTheme: ThemeModifierKey.Value {
    get { self[ThemeModifierKey.self] }
    set { self[ThemeModifierKey.self] = newValue }
  }
}
