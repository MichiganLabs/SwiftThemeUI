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
    ],
    targets: [
        .target(
            name: "SwiftThemeUI"
        ),
        .testTarget(
            name: "SwiftThemeUITests",
            dependencies: ["SwiftThemeUI"]
        ),
    ]
)
