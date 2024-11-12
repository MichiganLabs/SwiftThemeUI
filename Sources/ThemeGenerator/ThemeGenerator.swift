import Foundation
import Stencil
import PathKit
import ArgumentParser

@main
struct ThemeGenerator: ParsableCommand {
    @Argument(help: "Path to ThemeConfig.json file")
    var configPath: String
    
    @Argument(help: "Path to output directory")
    var outputPath: String
    
    @Flag(name: .shortAndLong, help: "Enable debug logging")
    private var verbose = false
    
    func run() throws {
        let configPath = URL(filePath: self.configPath)
        let outputPath = URL(filePath: self.outputPath)
        
        let configData = try Data(contentsOf: configPath)
        let config = try JSONDecoder().decode(JSONFormat.self, from: configData)
        
        try createThemeFiles(config: config, outputDir: outputPath)
    }
    
    private func createThemeFiles(config: JSONFormat, outputDir: URL) throws {
        let bundle = Bundle.module
        let paths = bundle.paths(forResourcesOfType: ".stencil", inDirectory: nil)
        let fileNames = paths.compactMap { $0.split(separator: "/").last }
        
        if self.verbose {
            print("Found \(fileNames.count) stencils.")
            fileNames.forEach { print($0) }
        }
        
        guard let resourcesPath = bundle.resourcePath else {
            throw CodeGeneratorError.resourcePathNotFound
        }
        
        let context = [
            "themeType": config.themeType,
            "defaultMode": config.defaultMode
        ]
        
        let fsLoader = FileSystemLoader(paths: [Path(resourcesPath)] )
        let environment = Environment(loader: fsLoader)
        
        var output = ""
        
        // Imports
        output += """
            import SwiftUI
            
            """
        
        // File contents
        for fileName in fileNames {
            let file = try environment.renderTemplate(name: String(fileName), context: context)
            output += """
        
        // Start of \(String(fileName))
        // ==============================================
        \(file)
        """
        }
        
        if self.verbose {
            print("Generated File:\n\n\(output)")
        }
        
        guard
            let data = output.data(using: .utf8)
        else {
            throw CodeGeneratorError.invalidData
        }
        
        try data.write(to: outputDir, options: .atomic)
        
        print("Theme files were generated successfully.")
        print("Output file: \(outputDir.path)")
    }
}

private struct JSONFormat: Decodable {
    let themeType: String
    let defaultMode: String
}

enum CodeGeneratorError: Error {
    case invalidArguments
    case invalidData
    case resourcePathNotFound
}
