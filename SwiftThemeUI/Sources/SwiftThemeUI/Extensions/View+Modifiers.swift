import SwiftUI

public extension View {
  func themeManaging(_ manager: ThemeManager) -> some View {
    self.modifier(ThemeProvidingViewModifier(manager: manager))
  }
}

public extension View {
  func accentColor(alias: KeyPath<GeneratedThemeType, Color>) -> some View {
    self.modifier(AccentColorModifier(element: alias))
  }

  func foregroundColor(alias: KeyPath<GeneratedThemeType, Color>) -> some View {
    self.modifier(ForegroundModifier(element: alias))
  }

  func cornerRadius(alias: KeyPath<GeneratedThemeType, CGFloat>) -> some View {
    self.modifier(CornerRadiusModifier(element: alias))
  }

  func font(alias: KeyPath<GeneratedThemeType, Font>) -> some View {
    self.modifier(FontModifier(element: alias))
  }
}
