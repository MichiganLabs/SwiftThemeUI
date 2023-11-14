import Foundation
import Stencil
import PathKit

@main
@available(macOS 13.0.0, *)
struct CodeGenerator {
  static func main() async throws {
    guard CommandLine.arguments.count == 3 else {
      throw CodeGeneratorError.invalidArguments
    }

    let configJsonUrl = URL(filePath: CommandLine.arguments[1])
    let outputDir = URL(filePath: CommandLine.arguments[2])

    let configJsonData = try Data(contentsOf: configJsonUrl)
    let config = try JSONDecoder().decode(JSONFormat.self, from: configJsonData)

    try Self.createThemeFiles(config: config, outputDir: outputDir)
  }

  static func createThemeFiles(config: JSONFormat, outputDir: URL) throws {
    let bundle = Bundle.module
    let paths = bundle.paths(forResourcesOfType: ".stencil", inDirectory: nil)
    let fileNames = paths.compactMap { $0.split(separator: "/").last }
    let resourcesPath = bundle.resourcePath!

    let context = [
      "themeType": config.themeType,
      "defaultMode": config.defaultMode
    ]

    let fsLoader = FileSystemLoader(paths: [Path(resourcesPath)] )
    let environment = Environment(loader: fsLoader)

    var contents = """
    import SwiftUI

    """

    for fileName in fileNames {
      let file = try environment.renderTemplate(name: String(fileName), context: context)
      contents += """
      
      // Start of \(String(fileName))
      // ==============================================
      \(file)
      """
    }

    guard
      let data = contents.data(using: .utf8)
    else {
      throw CodeGeneratorError.invalidData
    }

    try data.write(to: outputDir, options: .atomic)
  }
}

struct JSONFormat: Decodable {
  let themeType: String
  let defaultMode: String
}

@available(macOS 13.00.0, *)
enum CodeGeneratorError: Error {
  case invalidArguments
  case invalidData
}
