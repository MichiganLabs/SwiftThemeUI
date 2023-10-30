import SwiftUI

@propertyWrapper
public struct CurrentTheme<T>: DynamicProperty {
  @Environment(\.theme) var anyTheme: Any?

  public var wrappedValue: T {
    return self.anyTheme as! T
  }

  public init() {}
}
