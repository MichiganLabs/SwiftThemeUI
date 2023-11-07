import SwiftUI

public extension View {
  func themeManaging<T>(_ manager: ThemeManager<T>) -> some View {
    self.modifier(ThemeProvidingViewModifier(manager: manager))
  }
}

public extension View {
  func accentColor<T>(alias: KeyPath<T, Color>) -> some View {
    self.modifier(AccentColorModifier<T>(element: alias))
  }

  func foregroundColor<T>(alias: KeyPath<T, Color>) -> some View {
    self.modifier(ForegroundModifier<T>(element: alias))
  }

  func cornerRadius<T>(alias: KeyPath<T, CGFloat>) -> some View {
    self.modifier(CornerRadiusModifier<T>(element: alias))
  }

  func font<T>(alias: KeyPath<T, Font>) -> some View {
    self.modifier(FontModifier<T>(element: alias))
  }
}
