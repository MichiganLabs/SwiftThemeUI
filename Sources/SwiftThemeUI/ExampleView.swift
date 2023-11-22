import SwiftUI

struct ExampleView: View {
  @Environment(\.currentTheme) private var theme

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
        .environment(\.currentTheme, ThemeDarkMode())

      RoundedRectangle(
        cornerSize: CGSize(width: 10, height: 10)
      )
      .fill(alias: \.TextAccent)
      .frame(width: 50, height: 50)
    }
  }
}

#Preview {
  ExampleView()
    .environment(\.currentTheme, ThemeLightMode())
}


