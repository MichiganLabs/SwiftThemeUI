# SwiftThemeUI

## Description
This package gives you the ability to quickly and easily implement theme designs in your SwiftUI application. You simply provide your theme object (which can be of any type) to the `ThemeManager` and start using your design token values in your views with one of the many useful modifiers.

## Quick Start

Assuming you have a defined theme protocol...
```swift
public protocol Theme {
  var TextAccent: Color { get }
  var TextPrimary: Color { get }
  var BodyFont: Font { get }
  var CardRadius: CGFloat { get }
}
```

and have an implementation of that theme...
```swift
class LightTheme : Theme {
  let TextAccent = .red
  let TextPrimary = .blue
  let BodyFont = .system(size: 12)
  let CardRadius = 12.0
}
```

You can simply provide your theme to the `ThemeManager` and have it handle the rest!
```swift

struct RootView: View {
  @StateObject var manager = ThemeManager<Theme>(.static(LightTheme()))

  var body: some View {
    ContentView()
        .themeManaging(self.manager)
  }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .foregroundColor(alias: \Theme.TextColor)
                .font(alias: \Theme.BodyFont)
        }
        .cornerRadius(alias: \Theme.CardRadius)
    }
}
```


# Detailed Usage

## Changing Themes
You can change themes easily during the runtime of your application by simply setting the `current` property of the `ThemeManager`. If you would like to have your theme follow the `ColorSheme` of the application, simply provide a `.dynamic` theme to the manager and it will automatically update to the specified theme as the system updates.
```swift
// Instantiation
@StateObject var manager = ThemeManager<Theme>(.dynamic(light: LightTheme(), dark: DarkTheme()))

// Or, update the existing manager with a new theme
self.manager.current = .dynamic(light: LightTheme(), dark: DarkTheme())
```

## Theme Override
There are some situations where you might want a specific component to never change themes. In this situation, you can simply provide a theme object to the environment on your component and this will override the theme provided by `ThemeManager`.

```swift
Text("Hello World")
    .foregroundColor(alias: \Theme.TextAccent)
    // theme override
    .environment(\.theme, LightTheme())
```

## Usage Without Modifiers
If you come across a situation where a modifier is not available for your intended purpose, you can still use your alias tokens by gaining access to the current theme object through the use of the `@CurrentTheme` property wrapper.

```swift
struct ContentView: View {
  @CurrentTheme private var theme: Theme

  var body: some View {
    VStack(spacing: 8) {
      Text("Hello World")
        .foregroundColor(self.theme.TextAccent)
    }
  }
}

```