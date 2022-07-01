// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Features",
  platforms: [
    .iOS(.v15),
    .macOS(.v12),
  ],
  products: [
    .library(name: "Techniques", targets: ["Techniques"]),
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
  ]
)
