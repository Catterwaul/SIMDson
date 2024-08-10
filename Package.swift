// swift-tools-version: 6.0

import Foundation // for String.capitalized
import PackageDescription

let name = "SIMDson"

_ = Package(
  name: name,
  products: [.library(name: name, targets: [name])],
  targets: [.target(name: name)]
)
