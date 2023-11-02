// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftThemeUI",
    platforms: [
        .iOS(.v16),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "SwiftThemeUI",
            targets: ["SwiftThemeUI"]
        ),
        .plugin(name: "ThemeTypePlugin", targets: ["ThemeTypePlugin"])
    ],
    targets: [
        .target(
            name: "SwiftThemeUI"
        ),
        .executableTarget(
            name: "CodeGenerator"
        ),
        .plugin(
            name: "ThemeTypePlugin",
            capability: .buildTool(),
            dependencies: ["CodeGenerator"]
        ),
        .testTarget(
            name: "SwiftThemeUITests",
            dependencies: ["SwiftThemeUI"]
        ),
    ]
)
