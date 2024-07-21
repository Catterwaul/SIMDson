// swift-tools-version: 6.0

import PackageDescription

let name = "SIMDson"

_ = Package(
  name: name,
  platforms: [.iOS(.v17), .tvOS(.v17), .macOS(.v14)],
  products: [.library(name: name, targets: [name])],
  dependencies: [
    Dependency.swift(repositoryName: "docc-plugin").package,
    Dependency.catterwaul(name: "Tuplé", repositoryName: "Tuplay", branch: "swift-6").package
  ],
  targets: [
    .target(
      name: name,
      dependencies: [
        Dependency.catterwaul(name: "Tuplé", repositoryName: "Tuplay", branch: "swift-6").product
      ]
    ),
    .testTarget(
      name: name + ".Tests",
      dependencies: [
        .init(stringLiteral: name)
      ]
    )
  ]
)

// MARK: - Dependency

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

  static func catterwaul(name: String, repositoryName: String? = nil, branch: String = "main") -> Self {
    .init(
      organization: "Catterwaul",
      name: name,
      repositoryName: repositoryName ?? name,
      branch: branch
    )
  }

  private init(organization: String, name: String, repositoryName: String, branch: String = "main") {
    self.init(
      package: .package(
        url: "https://github.com/\(organization)/\(repositoryName)",
        branch: branch
      ),
      product: .product(name: name, package: repositoryName)
    )
  }
}
