import SwiftUI

struct ExampleView: View {
  @Environment(\.currentTheme) private var theme: ExampleTheme

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

#Preview {
  ExampleView()
    .environment(\.currentTheme, LightTheme())
}


