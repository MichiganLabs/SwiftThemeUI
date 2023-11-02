import SwiftUI

public protocol ExampleTheme {
  var TextAccent: Color { get }
  var TextPrimary: Color { get }
  var BodyFont: Font { get }
  var CardRadius: CGFloat { get }
}
