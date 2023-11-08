import Foundation
import PackagePlugin

@main
struct MockPlugin: BuildToolPlugin {
  func createBuildCommands(
    context: PackagePlugin.PluginContext,
    target: PackagePlugin.Target
  ) async throws -> [PackagePlugin.Command] {


    let sourceDir = target.directory
    let templateDir = target.directory.appending("Templates")
    let outputDir = context.pluginWorkDirectory
    let outputFile = context.pluginWorkDirectory.appending("Generated.swift")

    print("================================")
    print(target.directory)
    print(context.pluginWorkDirectory)
    print(outputFile)

//    Diagnostics.error("========================")

//    let output = context.pluginWorkDirectory.appending("GeneratedThemeType.swift")
    // , "--templates \(templateDir)", "--output \(output)
    return [
      .buildCommand(
        displayName: "Generate Mocks",
        executable: try context.tool(named: "sourcery").path,
        arguments: [
          "--sources", sourceDir,
          "--templates", templateDir,
          "--output", outputFile,
//          "--cacheBasePath", outputDir,
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
