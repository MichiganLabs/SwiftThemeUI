import SwiftUI

/// ThemeManager helps manage the themes of your application. To get started, simply instantiate ThemeManager and
/// provide the manager to the root view of your application using the `.themeManaging()` view modifier.
public class ThemeManager<T>: ObservableObject {
  public enum Appearance {
    case dynamic(light: T, dark: T)
    case `static`(T)
  }

  /// The currently selected theme. To update the theme, set `appearance` with your desired effect.
  @Published public private(set) var current: T

  /// Appearance drives the `current` theme and how/when it is updated.
  @Published public var appearance: Appearance {
    didSet {
      self.updateCurrentTheme()
    }
  }

  /// The current `colorScheme` of the system.
  private var systemColorScheme: ColorScheme = .light {
    didSet {
      self.updateCurrentTheme()
    }
  }

  public init(_ appearance: Appearance) {
    self.appearance = appearance
    self.current = Self.determineCurrentTheme(appearance: appearance, colorScheme: self.systemColorScheme)
  }
}

// MARK: Internal Package util functions
extension ThemeManager {
  /// Update the `ThemeManager` when the color scheme of the application changes. This will allow `ThemeManager`
  /// to automatically adjust the current theme to match the color scheme change.
  func update(from colorScheme: ColorScheme) {
    self.systemColorScheme = colorScheme
  }

  private func updateCurrentTheme() {
    self.current = Self.determineCurrentTheme(appearance: self.appearance, colorScheme: self.systemColorScheme)
  }

  private static func determineCurrentTheme(appearance: Appearance, colorScheme: ColorScheme) -> T {
    switch appearance {
    case .dynamic(let light, let dark):
      switch colorScheme {
      case .light:
        return light
      case .dark:
        return dark
      @unknown default:
        return light
      }
    case .static(let palette):
      return palette
    }
  }
}
