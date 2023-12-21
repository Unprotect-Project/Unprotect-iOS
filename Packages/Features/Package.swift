// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Features",
  platforms: [
    .iOS(.v17),
    .macOS(.v14),
  ],
  products: [
    .library(name: "Techniques", targets: ["Techniques"]),
    .library(name: "Snippets", targets: ["Snippets"]),
  ],
  dependencies: [
    .package(name: "Core", path: "./Core"),
  ],
  targets: [
    .target(
      name: "Techniques",
      dependencies: [
        .product(name: "Networking", package: "Core"),
        .product(name: "DesignSystem", package: "Core"),
        .product(name: "Models", package: "Core"),
      ]),
    .target(
      name: "Snippets",
      dependencies: [
        .product(name: "Networking", package: "Core"),
        .product(name: "DesignSystem", package: "Core"),
        .product(name: "Models", package: "Core"),
      ]),
  ]
)
