import SwiftUI

public typealias ThemeAlias = AnyKeyPath

protocol ThemeModifier {
  var theme: Any? { get }
  var element: ThemeAlias { get }

  var color: Color? { get }
  var radius: CGFloat? { get }
  var font: Font? { get }
}

extension ThemeModifier {
  var color: Color? {
    return self.theme[keyPath: self.element] as? Color
  }

  var radius: CGFloat? {
    return self.theme[keyPath: self.element] as? CGFloat
  }

  var font: Font? {
    return self.theme[keyPath: self.element] as? Font
  }
}
