import Foundation
import PackagePlugin

#if os(Linux)
import Glibc
#else
import Darwin
#endif

extension Path {
  /// Scans the receiver, then all of its parents looking for a file with a specific file name.
  ///
  /// - returns: Path to the configuration file, or nil if one cannot be found.
  func firstFileInParentDirectories(fileName: String) -> Path? {
    let proposedDirectory = sequence(
      first: self,
      next: { path in
        guard path.stem.count > 1 else {
          // Check we're not at the root of this filesystem, as `removingLastComponent()`
          // will continually return the root from itself.
          return nil
        }

        return path.removingLastComponent()
      }
    ).first { path in
      let potentialConfigurationFile = path.appending(subpath: fileName)
      return potentialConfigurationFile.isAccessible()
    }
    return proposedDirectory?.appending(subpath: fileName)
  }

  /// Safe way to check if the file is accessible from within the current process sandbox.
  private func isAccessible() -> Bool {
    let result = string.withCString { pointer in
      access(pointer, R_OK)
    }

    return result == 0
  }
}
