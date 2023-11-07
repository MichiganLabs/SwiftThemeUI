import SwiftUI

@propertyWrapper
public struct CurrentTheme<T>: DynamicProperty {
  @Environment(\.currentTheme) var someTheme: Any?

  public var wrappedValue: T {
    guard let theme = self.someTheme as? T else {
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
