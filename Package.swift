// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftThemeUI",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "SwiftThemeUI",
            targets: ["SwiftThemeUI"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftThemeUI",
            plugins: [
                .plugin(name: "ThemeTypePlugin")
            ]
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
