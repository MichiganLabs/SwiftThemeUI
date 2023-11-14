// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftThemeUI",
    platforms: [
        .iOS(.v16),
        .macOS(.v12),
    ],
    products: [
        .plugin(name: "ThemeBuildTool", targets: ["ThemeBuildTool"]),
        .library(name: "ExampleApp", targets: ["SwiftThemeUI"])
    ],
    dependencies: [
      .package(url: "https://github.com/stencilproject/Stencil.git", from: "0.15.1")
    ],
    targets: [
        .target(
            name: "SwiftThemeUI",
            plugins: [
              .plugin(name: "ThemeBuildTool"),
            ]
        ),
        .plugin(
            name: "ThemeBuildTool",
            capability: .buildTool(),
            dependencies: [
              "CodeGenerator",
            ]
        ),
        .executableTarget(
            name: "CodeGenerator",
            dependencies: [
              "Stencil"
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "SwiftThemeUITests",
            dependencies: ["SwiftThemeUI"]
        ),
    ]
)
