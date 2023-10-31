// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftThemeUI",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
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
