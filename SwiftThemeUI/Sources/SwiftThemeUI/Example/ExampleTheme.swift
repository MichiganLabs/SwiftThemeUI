import SwiftUI

public protocol Theme {
  var TextAccent: Color { get }
  var TextPrimary: Color { get }
  var BodyFont: Font { get }
  var CardRadius: CGFloat { get }
}


class LightTheme : Theme {
  let TextAccent: Color = .red
  let TextPrimary: Color = .blue
  let BodyFont: Font = .system(size: 16, weight: .thin)
  let CardRadius: CGFloat = 12
}

class DarkTheme : Theme {
  let TextAccent: Color = .yellow
  let TextPrimary: Color = .white
  let BodyFont: Font = .system(size: 14, weight: .bold)
  let CardRadius: CGFloat = 20
}
