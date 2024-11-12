// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftThemeUI",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .plugin(name: "ThemeBuildTool", targets: ["ThemeBuildTool"]),
        .library(name: "ExampleApp", targets: ["ExampleApp"])
    ],
    dependencies: [
      .package(url: "https://github.com/stencilproject/Stencil.git", from: "0.15.1"),
      .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0")
    ],
    targets: [
        .plugin(
            name: "ThemeBuildTool",
            capability: .buildTool(),
            dependencies: [
              "ThemeGenerator",
            ]
        ),
        .executableTarget(
            name: "ThemeGenerator",
            dependencies: [
              "Stencil",
              .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
            resources: [.process("Resources")]
        ),
        
        // Example setup when using build tool plugin
        .target(
            name: "ExampleApp",
            plugins: [
              .plugin(name: "ThemeBuildTool"),
            ]
        ),
    ]
)
