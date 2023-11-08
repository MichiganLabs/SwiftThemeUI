// swift-tools-version: 5.9
import PackageDescription

// FINALLY, an example:
// https://www.polpiella.dev/sourcery-swift-package-command-plugin

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
        .plugin(name: "MockPlugin", targets: ["MockPlugin"]),
        .plugin(name: "SourceryCommand", targets: ["SourceryCommand"])
    ],
    dependencies: [
      .package(url: "https://github.com/realm/SwiftLint.git", from: "0.53.0"),
    ],
    targets: [
        .target(
            name: "SwiftThemeUI",
            plugins: [
              .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
            ]
        ),
        .plugin(
            name: "MockPlugin",
            capability: .buildTool(),
            dependencies: [
//              .target(name: "SourceryBinary", condition: .when(platforms: [.macOS])),
              "SourceryBinary"
            ]
        ),
        .plugin(
            name: "SourceryCommand",
            capability: .command(
                intent: .custom(
                  verb: "sourcery-code-generation",
                  description: "Generates Swift files from a given set of inputs"
                ),
                permissions: [
                  .writeToPackageDirectory(
                    reason: "Need access to the package directory to generate files"
                  )
                ]
            ),
            dependencies: ["SourceryBinary"]
        ),
//        .binaryTarget(
//          name: "SourceryBinary",
//          url: "https://github.com/krzysztofzablocki/Sourcery/releases/download/2.0.2/sourcery-2.0.2.artifactbundle.zip",
//          checksum: "28d2c35db0cdb0c242b4faa042c137ede4f1d4d242b77ee6363530d3a23d6baf"
//        ),

        .binaryTarget(name: "SourceryBinary", path: "Sourcery.artifactbundle"),
//          .binaryTarget(name: "SourceryBinary", path: "sourcery.artifactbundle"),
        .testTarget(
            name: "SwiftThemeUITests",
            dependencies: ["SwiftThemeUI"]
        ),
    ]
)
