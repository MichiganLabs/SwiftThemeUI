import Foundation
import PackagePlugin

@main
struct ToomasKitPlugin: BuildToolPlugin {
  func createBuildCommands(
    context: PackagePlugin.PluginContext,
    target: PackagePlugin.Target
  ) async throws -> [PackagePlugin.Command] {
    let inputJSON = target.directory.appending("ThemeSource.json")
    let output = context.pluginWorkDirectory.appending("GeneratedThemeType.swift")
    return [
      .buildCommand(
        displayName: "Generate Code",
        executable: try context.tool(named: "CodeGenerator").path,
        arguments: [inputJSON, output],
        environment: [:],
        inputFiles: [inputJSON],
        outputFiles: [output]
      )
    ]
  }
}
