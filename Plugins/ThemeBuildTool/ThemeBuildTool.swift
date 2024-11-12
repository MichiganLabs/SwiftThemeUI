import Foundation
import PackagePlugin

@main
struct ThemeBuilderPlugin: BuildToolPlugin {
  func createBuildCommands(context: PackagePlugin.PluginContext, target: PackagePlugin.Target) async throws -> [PackagePlugin.Command] {

    let configPath = target.directory.appending("ThemeConfig.json")
    let outputPath = context.pluginWorkDirectory.appending("Generated.swift")
      
    // `buildCommand` will be incorporated into the build system's command graph and will run if any of the
    // output files are missing or if the contents of any of the input files have changed since the last
    // time the command ran.
    return [
        // runs a command when any of its output files are needed by the build, but are out of date
      .buildCommand(
        displayName: "Generate Theme Files",
        executable: try context.tool(named: "ThemeGenerator").path,
        arguments: [configPath, outputPath],
        environment: [:],
        inputFiles: [configPath], // Used to observe changes to the config file
        outputFiles: [outputPath]
      ),
    ]
  }
}
