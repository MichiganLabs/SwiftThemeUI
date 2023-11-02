import Foundation

@main
@available(macOS 13.0.0, *)
struct CodeGenerator {
  static func main() async throws {
    // Use swift-argument-parser or just CommandLine, here we just imply that 2 paths are passed in: input and output
    guard CommandLine.arguments.count == 3 else {
      throw CodeGeneratorError.invalidArguments
    }

    // arguments[0] is the path to this command line tool
    let input = URL(filePath: CommandLine.arguments[1])
    let output = URL(filePath: CommandLine.arguments[2])

    let swiftData = try Data(contentsOf: input)
    guard let swiftString = String(data: swiftData, encoding: .utf8) else {
      throw CodeGeneratorError.invalidData
    }

    let regex = try Regex("protocol \\s*(\\S+)")
    guard let match = swiftString.firstMatch(of: regex) else {
      throw CodeGeneratorError.protocolNotFound
    }

    let protocolName = swiftString[match.output[1].range!]

    let code = """
    \(swiftString)

    public typealias GeneratedThemeType = \(protocolName)
    """

    print("Generated code:\n\n\(code)")

    guard let data = code.data(using: .utf8) else {
      throw CodeGeneratorError.invalidData
    }
    try data.write(to: output, options: .atomic)
  }
}

@available(macOS 13.00.0, *)
enum CodeGeneratorError: Error {
  case invalidArguments
  case invalidData
  case protocolNotFound
}
