import SwiftUI
import SwiftThemeUI

struct ThemeSwitcherView: View {
  @EnvironmentObject private var manager: ThemeManager<ExampleTheme>

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

#Preview {
  ThemeSwitcherView()
}
