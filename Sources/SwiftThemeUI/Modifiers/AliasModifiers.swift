import SwiftUI

struct AccentColorModifier: ViewModifier, ThemeModifier {
  @CurrentTheme var theme: GeneratedThemeType

  let element: ThemeAlias

  @ViewBuilder
  func body(content: Content) -> some View {
    content.accentColor(self.color)
  }
}

struct ForegroundModifier: ViewModifier, ThemeModifier {
  @CurrentTheme var theme: GeneratedThemeType

  let element: ThemeAlias

  @ViewBuilder
  func body(content: Content) -> some View {
    content.foregroundColor(self.color)
  }
}

struct CornerRadiusModifier: ViewModifier, ThemeModifier {
  @CurrentTheme var theme: GeneratedThemeType

  let element: ThemeAlias

  @ViewBuilder
  func body(content: Content) -> some View {
    content.cornerRadius(self.radius ?? 0)
  }
}

struct FontModifier: ViewModifier, ThemeModifier {
  @CurrentTheme var theme: GeneratedThemeType

  let element: ThemeAlias

  @ViewBuilder
  func body(content: Content) -> some View {
    content.font(self.font)
  }
}



