import Foundation
import SwiftUI
import SwiftThemeUI

struct ExampleView: View {
  @CurrentTheme private var theme: ExampleTheme

  var body: some View {
    VStack(spacing: 8) {
      Text("Hello World")
        .foregroundColor(alias: \ExampleTheme.TextAccent)
        .font(alias: \ExampleTheme.BodyFont)
        .padding(12)
        .background(.blue)
        .cornerRadius(alias: \ExampleTheme.CardRadius)

      Text("Hello World")
        .foregroundColor(alias: \ExampleTheme.TextAccent)
        .font(alias: \ExampleTheme.BodyFont)
        .padding(12)
        .background(.orange)
        .cornerRadius(alias: \ExampleTheme.CardRadius)
        // theme override
        .environment(\.currentTheme, LightTheme())

      Text("Hello World")
        .foregroundColor(self.theme.TextAccent)
        .foregroundColor(alias: \ExampleTheme.TextAccent)
        .font(alias: \ExampleTheme.BodyFont)
        .padding(12)
        .background(.orange)
        .cornerRadius(alias: \ExampleTheme.CardRadius)
        // theme override
        .environment(\.currentTheme, LightTheme())
    }
  }
}

#Preview {
  ExampleView()
    .environment(\.currentTheme, LightTheme())
}


