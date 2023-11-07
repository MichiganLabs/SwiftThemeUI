import SwiftUI
import SwiftThemeUI

protocol ExampleTheme: Themeable {
  var TextAccent: Color { get }
  var TextPrimary: Color { get }
  var BodyFont: Font { get }
  var CardRadius: CGFloat { get }
}

class LightTheme : ExampleTheme {
  let TextAccent: Color = .red
  let TextPrimary: Color = .blue
  let BodyFont: Font = .system(size: 16, weight: .thin)
  let CardRadius: CGFloat = 12
}

class DarkTheme : ExampleTheme {
  let TextAccent: Color = .yellow
  let TextPrimary: Color = .white
  let BodyFont: Font = .system(size: 14, weight: .bold)
  let CardRadius: CGFloat = 20
}
