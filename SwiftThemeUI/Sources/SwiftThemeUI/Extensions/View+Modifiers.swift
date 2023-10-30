import SwiftUI

public extension View {
  func themeManaging<T>(_ manager: ThemeManager<T>) -> some View {
    self.modifier(ThemeProvidingViewModifier(manager: manager))
  }
}

public extension View {
  func accentColor<T>(alias: KeyPath<T, Color>) -> some View {
    self.modifier(AccentColorModifier(element: alias))
  }

  func foregroundColor<T>(alias: KeyPath<T, Color>) -> some View {
    self.modifier(ForegroundModifier(element: alias))
  }

  func cornerRadius(alias: ThemeAlias) -> some View {
    self.modifier(CornerRadiusModifier(element: alias))
  }

  func font(alias: ThemeAlias) -> some View {
    self.modifier(FontModifier(element: alias))
  }
}
