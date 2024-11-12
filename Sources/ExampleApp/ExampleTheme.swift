import SwiftUI

public protocol ExampleTheme {
  var TextAccent: Color { get }
  var TextPrimary: Color { get }
  var BodyFont: Font { get }
  var CardRadius: CGFloat { get }
}

class ThemeLightMode: ExampleTheme {
  let TextAccent: Color = .red
  let TextPrimary: Color = .blue
  let BodyFont: Font = .system(size: 16, weight: .thin)
  let CardRadius: CGFloat = 12
}

class ThemeDarkMode : ExampleTheme {
  let TextAccent: Color = .yellow
  let TextPrimary: Color = .white
  let BodyFont: Font = .system(size: 14, weight: .bold)
  let CardRadius: CGFloat = 20
}

public let BrandTheme: ThemeType = .dynamic(light: ThemeLightMode(), dark: ThemeDarkMode())
