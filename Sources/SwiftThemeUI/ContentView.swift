import SwiftUI

struct ContentView: View {
  @StateObject var manager = ThemeManager(BrandTheme)
  
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
