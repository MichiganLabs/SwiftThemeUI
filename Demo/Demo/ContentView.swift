import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      ThemeView()
      Spacer()
      ThemeSwitcherView()
    }
  }
}

#Preview {
  ContentView()
}
