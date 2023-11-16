# SwiftThemeUI

## Description
This package gives you the ability to quickly and easily implement theme designs in your SwiftUI application.

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
class BrandThemeLightMode : Theme {
  let TextAccent = .red
  let TextPrimary = .blue
  let BodyFont = .system(size: 12)
  let CardRadius = 12.0
}
```

Add a `ThemeConfig.json` file to the root of your target that identifies the protocol you'd like to use.
```json
{
  "themeType": "Theme",
  "defaultMode": "BrandThemeLightMode"
}
```

Then, you can simply provide your theme to the `ThemeManager` and have it handle the rest!
```swift

struct RootView: View {
  @StateObject var manager = ThemeManager(.static(BrandThemeLightMode()))

  var body: some View {
    ContentView()
        .themeManaging(self.manager)
  }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .foregroundColor(alias: \.TextColor)
                .font(alias: \.BodyFont)
        }
        .cornerRadius(alias: \.CardRadius)
    }
}
```


# Detailed Usage

## Changing Themes
You can change themes easily during the runtime of your application by simply setting the `theme` property of the `ThemeManager`. If you would like to have your theme follow the `ColorSheme` of the application, simply provide a `.dynamic` theme to the manager and it will automatically update to the specified theme as the system updates.
```swift
// Instantiation
@StateObject var manager = ThemeManager(.dynamic(light: BrandThemeLightMode(), dark: BrandThemeDarkMode()))

// Or, update the existing manager with a new theme
self.manager.theme = .dynamic(light: BrandThemeLightMode(), dark: BrandThemeDarkMode())
```

## Theme Override
There are some situations where you might want a specific component to never change themes. In this situation, you can simply provide a theme object to the environment on your component and this will override the theme provided by `ThemeManager`.

```swift
Text("Hello World")
    .foregroundColor(alias: \.TextAccent)
    // theme override
    .environment(\.theme, BrandThemeLightMode())
```

## Usage Without Modifiers
If you come across a situation where a modifier is not available for your intended purpose, you can still use your alias tokens by gaining access to the current theme object through the use of the `@CurrentTheme` property wrapper.

```swift
struct ContentView: View {
  @Environment(\.currentTheme) private var theme

  var body: some View {
    VStack(spacing: 8) {
      Text("Hello World")
        .foregroundColor(self.theme.TextAccent)
    }
  }
}

```
