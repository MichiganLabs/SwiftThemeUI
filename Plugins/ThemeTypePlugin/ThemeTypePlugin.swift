import Foundation
import PackagePlugin

@main
struct ThemeTypePlugin: BuildToolPlugin {
  func createBuildCommands(
    context: PackagePlugin.PluginContext,
    target: PackagePlugin.Target
  ) async throws -> [PackagePlugin.Command] {
    // Look for a `ThemeSource.swift` file in the parent directories
    guard let inputPath = context.package.directory.firstFileInParentDirectories(fileName: "ThemeSource.swift") else {
      throw ThemeTypePluginError.themeSourceNotFound
    }

    // Specify a location for the output file
    let output = context.pluginWorkDirectory.appending("GeneratedThemeType.swift")

    return [
      .buildCommand(
        displayName: "Generate Code",
        executable: try context.tool(named: "CodeGenerator").path,
        arguments: [inputPath, output],
        environment: [:],
        inputFiles: [inputPath], // input files are "watched" to know when to re-run the plugin
        outputFiles: [output] // make generated file(s) available to the package
      )
    ]
  }
}

@available(macOS 13.00.0, *)
enum ThemeTypePluginError: Error {
  case themeSourceNotFound
}

