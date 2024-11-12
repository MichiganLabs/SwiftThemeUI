import SwiftUI

struct ThemeSwitcherView: View {
  @EnvironmentObject private var manager: ThemeManager

  var body: some View {
    VStack {
      Button("Light") {
        self.manager.theme = .static(ThemeLightMode())
      }

      Button("Dark") {
        self.manager.theme = .static(ThemeDarkMode())
      }

      Button("System") {
        self.manager.theme = BrandTheme
      }
    }
  }
}

#Preview {
  ThemeSwitcherView()
}
