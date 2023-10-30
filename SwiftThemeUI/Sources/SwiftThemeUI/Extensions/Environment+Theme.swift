import Foundation
import SwiftUI

struct ThemeModifierKey: EnvironmentKey {
  static var defaultValue: Any? = nil
}

extension EnvironmentValues {
  /// Computed variable used for accessing the environment's color palette
  var theme: ThemeModifierKey.Value {
    get { self[ThemeModifierKey.self] }
    set { self[ThemeModifierKey.self] = newValue }
  }
}
