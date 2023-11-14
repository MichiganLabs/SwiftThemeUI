import SwiftUI

struct ContentView: View {
  @StateObject var manager = ThemeManager(.dynamic(light: LightTheme(), dark: DarkTheme()))
  
  var body: some View {
    VStack {
      ExampleView()
      Spacer()
      ThemeSwitcherView()
    }
    .themeManaging(self.manager)
  }
}

#Preview {
  ContentView()
}
