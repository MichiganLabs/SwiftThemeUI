import SwiftUI

struct ThemeSwitcherView: View {
  @EnvironmentObject private var manager: ThemeManager

  var body: some View {
    VStack {
      Button("Light") {
        self.manager.themeType = .static(LightTheme())
      }

      Button("Dark") {
        self.manager.themeType = .static(DarkTheme())
      }

      Button("System") {
        self.manager.themeType = .dynamic(light: LightTheme(), dark: DarkTheme())
      }
    }
  }
}

#Preview {
  ThemeSwitcherView()
}
