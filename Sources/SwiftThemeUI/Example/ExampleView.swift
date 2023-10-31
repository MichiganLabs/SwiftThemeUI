import Foundation
import SwiftUI

struct ThemeView: View {
  @CurrentTheme private var theme: ExampleTheme

  var body: some View {
    VStack(spacing: 8) {
      Text("Hello World")
        .foregroundColor(alias: \.TextAccent)
        .font(alias: \.BodyFont)
        .padding(12)
        .background(.blue)
        .cornerRadius(alias: \.CardRadius)

      Text("Hello World")
        .foregroundColor(alias: \.TextAccent)
        .font(alias: \.BodyFont)
        .padding(12)
        .background(.orange)
        .cornerRadius(alias: \.CardRadius)
        // theme override
        .environment(\.currentTheme, LightTheme())

      Text("Hello World")
        .foregroundColor(self.theme.TextAccent)
        .foregroundColor(alias: \.TextAccent)
        .font(alias: \.BodyFont)
        .padding(12)
        .background(.orange)
        .cornerRadius(alias: \.CardRadius)
        // theme override
        .environment(\.currentTheme, LightTheme())
    }
  }
}

struct ThemeSwitcherView: View {
  @EnvironmentObject private var manager: ThemeManager

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
  @StateObject var manager = ThemeManager(.dynamic(light: LightTheme(), dark: DarkTheme()))

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
