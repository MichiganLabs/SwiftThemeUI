import Foundation
import PackagePlugin

@main
struct ThemeBuilderPlugin: BuildToolPlugin {
  func createBuildCommands(context: PackagePlugin.PluginContext, target: PackagePlugin.Target) async throws -> [PackagePlugin.Command] {

    let configJSON = target.directory.appending("ThemeConfig.json")
    let generatedFile = context.pluginWorkDirectory.appending("Generated.swift")
      
    // Check if the generated file exists and is up-to-date
    let fileManager = FileManager.default
    let configAttributes = try fileManager.attributesOfItem(atPath: configJSON.string)
    let generatedAttributes = try fileManager.attributesOfItem(atPath: generatedFile.string)

    if
      let configModificationDate = configAttributes[.modificationDate] as? Date,
      let generatedModificationDate = generatedAttributes[.modificationDate] as? Date,
      generatedModificationDate >= configModificationDate
    {
      // Generated file is up-to-date, no need to run the build command
      return []
    }

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
