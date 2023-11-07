import SwiftUI

/// A view modifier that sets up theme provider to be able to used across view hierarchy.
struct ThemeProvidingViewModifier<T>: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var themeManager: ThemeManager<T>

    func body(content: Content) -> some View {
        content
          .onAppear {
            self.themeManager.update(from: self.colorScheme)
          }
          .onChange(of: self.colorScheme) { colorScheme in
            self.themeManager.update(from: colorScheme)
          }
          .environmentObject(self.themeManager)
          .environment(\.currentTheme, self.themeManager.current)
    }

    init(manager: ThemeManager<T>) {
        self.themeManager = manager
    }
}
