import PackagePlugin
import Foundation

@main
struct SourceryCommand: CommandPlugin {
  func performCommand(context: PluginContext, arguments: [String]) async throws {
    // 1
    let configFilePath = context.package.directory.appending(subpath: ".sourcery.yml").string
    guard FileManager.default.fileExists(atPath: configFilePath) else {
        Diagnostics.error("Could not find config at: \(configFilePath)")
        return
    }

//    let sourceDir = FileManager.default.currentDirectoryPath
//
////    let sourceDir = target.directory
//    let templateDir = sourceDir.appending("/Templates")
//    let outputDir = context.pluginWorkDirectory
//    let outputFile = context.pluginWorkDirectory.appending("/Sources/SourceryPluginSample")

    //2
    let sourceryExecutable = try context.tool(named: "sourcery")
    let sourceryURL = URL(fileURLWithPath: sourceryExecutable.path.string)

    // 3
    let process = Process()
    process.executableURL = sourceryURL

    // 4
    process.arguments = [
//      "--sources", sourceDir,
//      "--templates", templateDir,
//      "--output", outputFile.string,
      "--disableCache"
    ]

    // 5
    try process.run()
    process.waitUntilExit()

    // 6
    let gracefulExit = process.terminationReason == .exit && process.terminationStatus == 0
    if !gracefulExit {
        Diagnostics.error("🛑 The plugin execution failed")
    }
  }
}
