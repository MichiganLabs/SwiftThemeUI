import Foundation
import SwiftUI

struct ThemeView: View {
  @CurrentTheme private var theme: Theme

  var body: some View {
    VStack(spacing: 8) {
      Text("Hello World")
        .foregroundColor(alias: \Theme.TextAccent)
        .font(alias: \Theme.BodyFont)
        .padding(12)
        .background(.blue)
        .cornerRadius(alias: \Theme.CardRadius)

      Text("Hello World")
        .foregroundColor(alias: \Theme.TextAccent)
        .font(alias: \Theme.BodyFont)
        .padding(12)
        .background(.orange)
        .cornerRadius(alias: \Theme.CardRadius)
        // theme override
        .environment(\.theme, LightTheme())

      Text("Hello World")
        .foregroundColor(self.theme.TextAccent)
        .foregroundColor(alias: \Theme.TextAccent)
        .font(alias: \Theme.BodyFont)
        .padding(12)
        .background(.orange)
        .cornerRadius(alias: \Theme.CardRadius)
        // theme override
        .environment(\.theme, LightTheme())
    }
  }
}

struct ThemeSwitcherView: View {
  @EnvironmentObject private var manager: ThemeManager<Theme>

  var body: some View {
    VStack {
      Button("Light") {
        self.manager.appearance = .static(LightTheme())
      }

      Button("Dark") {
        self.manager.appearance = .static(DarkTheme())
      }

      Button("System") {
        self.manager.appearance = .dynamic(light: LightTheme(), dark: DarkTheme())
      }
    }
  }
}

struct RootView: View {
  @StateObject var manager = ThemeManager<Theme>(.dynamic(light: LightTheme(), dark: DarkTheme()))

  var body: some View {
    VStack {
      ThemeView()
      Spacer()
      ThemeSwitcherView()
    }
    .themeManaging(self.manager)
  }
}

#Preview {
  RootView()
}
