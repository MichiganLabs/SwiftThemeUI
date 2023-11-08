import Foundation
import PackagePlugin

@main
struct SourceryBuildTool: BuildToolPlugin {
  func createBuildCommands(
    context: PackagePlugin.PluginContext,
    target: PackagePlugin.Target
  ) async throws -> [PackagePlugin.Command] {

    let sourceDir = target.directory
    let templateDir = target.directory.appending("Templates")
//    let outputDir = context.pluginWorkDirectory
    let outputFile = context.pluginWorkDirectory.appending("Generated.swift")

    return [
      .buildCommand(
        displayName: "Generate Mocks",
        executable: try context.tool(named: "sourcery").path,
        arguments: [
          "--sources", sourceDir,
          "--templates", templateDir,
          "--output", outputFile,
//          "--cacheBasePath", outputDir, // enable when we can use a newer version of sourcery
          "--verbose",
          "--disableCache"
        ],
        environment: [:],
        inputFiles: [],
        outputFiles: [outputFile]
      )
    ]
  }
}
