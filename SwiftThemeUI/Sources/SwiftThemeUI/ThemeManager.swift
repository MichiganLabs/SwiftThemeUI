import SwiftUI

public class ThemeManager<T>: ObservableObject {
  public enum Appearance {
    case dynamic(light: T, dark: T)
    case `static`(T)
  }

  public var current: T

  @Published public var appearance: Appearance {
    didSet {
      self.current = Self.determineCurrentPalette(
        appearance: self.appearance,
        colorScheme: self.systemColorScheme
      )
    }
  }

  private var systemColorScheme: ColorScheme = .light {
    didSet {
      self.current = Self.determineCurrentPalette(
        appearance: self.appearance,
        colorScheme: self.systemColorScheme
      )
    }
  }

  public init(_ appearance: Appearance) {
    self.appearance = appearance
    self.current = Self.determineCurrentPalette(appearance: appearance, colorScheme: self.systemColorScheme)
  }


  func update(from colorScheme: ColorScheme) {
    self.systemColorScheme = colorScheme
  }

  private static func determineCurrentPalette(appearance: Appearance, colorScheme: ColorScheme) -> T {
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
