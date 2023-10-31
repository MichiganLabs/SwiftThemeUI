import SwiftUI

@propertyWrapper
public struct CurrentTheme: DynamicProperty {
  @Environment(\.currentTheme) var anyTheme: GeneratedThemeType?

  public var wrappedValue: GeneratedThemeType {
    guard let theme = self.anyTheme else {
      fatalError(
        """
        Unable to resolve the current theme! Verify your instance of `ThemeManager` was injected at the root view of
        the application using the .themeManaging() modifier.
        """
      )
    }

    return theme
  }

  public init() {}
}
