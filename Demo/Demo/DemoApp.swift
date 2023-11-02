import SwiftUI
import SwiftThemeUI

@main
struct DemoApp: App {
  @StateObject var manager = ThemeManager(.dynamic(light: LightTheme(), dark: DarkTheme()))

  var body: some Scene {
    WindowGroup {
      ContentView()
        .themeManaging(self.manager)
    }
  }
}
