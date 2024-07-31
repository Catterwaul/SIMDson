// swift-tools-version: 6.0

import Foundation // for String.capitalized
import PackageDescription

let name = "SIMDson"
let swiftSettings: [SwiftSetting] = [
  .unsafeFlags(["-Xfrontend", "-requirement-machine-max-rule-count=8000"])
]

_ = Package(
  name: name,
  platforms: [.iOS(.v16), .macOS(.v14)],
  products: [.library(name: name, targets: [name])],
  dependencies: dependencies.map(\.package),
  targets: [
    .target(
      name: name,
      dependencies: dependencies.dropFirst().map(\.product),
      swiftSettings: swiftSettings
    ),
    .testTarget(
      name: name + ".Tests",
      dependencies: [.init(stringLiteral: name)],
      swiftSettings: swiftSettings
    )
  ]
)

// MARK: - Dependency

nonisolated var dependencies: [Dependency]  {
  [ .swift(repositoryName: "docc-plugin"),
    .apple(repositoryName: "algorithms"),
    .catterwaul(name: "Tuplé", repositoryName: "Tuplay")
  ]
}

struct Dependency {
  let package: Package.Dependency
  let product: Target.Dependency
}

extension Dependency {
  static func apple(repositoryName: String) -> Self {
    .swift(organization: "apple", repositoryName: repositoryName)
  }

  static func swift(organization: String = "swiftlang", repositoryName: String) -> Self {
    .init(
      organization: organization,
      name: repositoryName.split(separator: "-").map(\.capitalized).joined(),
      repositoryName: "swift-\(repositoryName)"
    )
  }

  static func catterwaul(name: String, repositoryName: String? = nil, branch: String? = nil) -> Self {
    .init(
      organization: "Catterwaul",
      name: name,
      repositoryName: repositoryName ?? name,
      branch: branch
    )
  }

  private init(organization: String, name: String, repositoryName: String, branch: String? = nil) {
    self.init(
      package: .package(
        url: "https://github.com/\(organization)/\(repositoryName)",
        branch: branch ?? "main"
      ),
      product: .product(name: name, package: repositoryName)
    )
  }
}
