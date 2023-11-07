import SwiftUI

struct AccentColorModifier<T>: ViewModifier, ThemeModifier {
  @CurrentTheme var theme: T

  let element: ThemeAlias

  @ViewBuilder
  func body(content: Content) -> some View {
    content.accentColor(self.color)
  }
}

struct ForegroundModifier<T>: ViewModifier, ThemeModifier {
  @CurrentTheme var theme: T

  let element: ThemeAlias

  @ViewBuilder
  func body(content: Content) -> some View {
    content.foregroundColor(self.color)
  }
}

struct CornerRadiusModifier<T>: ViewModifier, ThemeModifier {
  @CurrentTheme var theme: T

  let element: ThemeAlias

  @ViewBuilder
  func body(content: Content) -> some View {
    content.cornerRadius(self.radius ?? 0)
  }
}

struct FontModifier<T>: ViewModifier, ThemeModifier {
  @CurrentTheme var theme: T

  let element: ThemeAlias

  @ViewBuilder
  func body(content: Content) -> some View {
    content.font(self.font)
  }
}



