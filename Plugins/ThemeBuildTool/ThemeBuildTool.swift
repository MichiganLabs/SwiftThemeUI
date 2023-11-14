import Foundation
import PackagePlugin

@main
struct ToomasKitPlugin: BuildToolPlugin {
  func createBuildCommands(context: PackagePlugin.PluginContext, target: PackagePlugin.Target) async throws -> [PackagePlugin.Command] {

    let configJSON = target.directory.appending("ThemeConfig.json")
    let generatedFile = context.pluginWorkDirectory.appending("Generated.swift")

    return [
      .buildCommand(
        displayName: "Generate Theme Files",
        executable: try context.tool(named: "CodeGenerator").path,
        arguments: [configJSON, generatedFile],
        environment: [:],
        inputFiles: [configJSON],
        outputFiles: [generatedFile]
      ),
    ]
  }
}
